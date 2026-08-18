#!/usr/bin/env bash
#
# Instala skills de los atlas sectoriales del Sistema Atlas Colombia.
#
# Copia las skills de uno o varios atlas sectoriales (subcarpetas atlas/<alias>
# de este monorepo) hacia una carpeta destino, típicamente dentro del proyecto
# del usuario (ej. .claude/skills para Claude Code, .agents/skills para Codex).
#
# Ejemplos:
#   bash instalar.sh --atlas ambiental
#   bash instalar.sh --atlas todos --actualizar
#   bash instalar.sh --atlas ambiental --entidad navegar-anla --global
#
set -euo pipefail

# Tabla de atlas registrados: alias -> nombre de la subcarpeta bajo atlas/.
# Al registrar un atlas nuevo, agregar una línea aquí.
declare -A atlas_registrados=(
    ["ambiental"]="ambiental"
    ["minero-energetico"]="minero-energetico"
)

atlas_arg=""
destino=".claude/skills"
entidad_arg=""
modo_global=0
actualizar=0

mostrar_uso() {
    echo "Uso: bash instalar.sh --atlas ambiental|minero-energetico|todos[,...] [opciones]"
    echo ""
    echo "Opciones:"
    echo "  --atlas LISTA      Atlas a instalar, separados por coma (obligatorio)"
    echo "  --destino RUTA     Carpeta destino (default: .claude/skills)"
    echo "  --entidad LISTA    Solo estas skills, separadas por coma (un solo atlas)"
    echo "  --global           Instala en la carpeta del usuario en vez del proyecto"
    echo "  --actualizar       git pull en los repos fuente antes de copiar"
}

while [ $# -gt 0 ]; do
    case "$1" in
        --atlas)
            atlas_arg="$2"
            shift 2
            ;;
        --destino)
            destino="$2"
            shift 2
            ;;
        --entidad)
            entidad_arg="$2"
            shift 2
            ;;
        --global)
            modo_global=1
            shift
            ;;
        --actualizar)
            actualizar=1
            shift
            ;;
        *)
            echo "Error: opción desconocida '$1'" >&2
            mostrar_uso
            exit 1
            ;;
    esac
done

if [ -z "$atlas_arg" ]; then
    echo "Error: --atlas es obligatorio." >&2
    mostrar_uso
    exit 1
fi

raiz_sistema="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# En el monorepo, las skills de cada atlas viven en atlas/<alias>/skills.
raiz_atlas="$raiz_sistema/atlas"

# --- Expandir "todos" y resolver alias pedidos ---
IFS=',' read -r -a atlas_pedidos_raw <<< "$atlas_arg"
declare -a alias_pedidos=()
for a in "${atlas_pedidos_raw[@]}"; do
    if [ "$a" = "todos" ]; then
        for clave in "${!atlas_registrados[@]}"; do
            alias_pedidos+=("$clave")
        done
    else
        alias_pedidos+=("$a")
    fi
done

# Eliminar duplicados
declare -A vistos=()
declare -a alias_unicos=()
for a in "${alias_pedidos[@]}"; do
    if [ -z "${vistos[$a]:-}" ]; then
        alias_unicos+=("$a")
        vistos[$a]=1
    fi
done
alias_pedidos=("${alias_unicos[@]}")

# --- Validación: alias desconocidos ---
for a in "${alias_pedidos[@]}"; do
    if [ -z "${atlas_registrados[$a]:-}" ]; then
        echo "Error: el alias de atlas '$a' no existe." >&2
        echo "Alias válidos: ${!atlas_registrados[*]}, todos" >&2
        exit 1
    fi
done

# --- Validación: subcarpetas de atlas existen en el monorepo ---
for a in "${alias_pedidos[@]}"; do
    carpeta="${atlas_registrados[$a]}"
    ruta_atlas="$raiz_atlas/$carpeta"
    if [ ! -d "$ruta_atlas" ]; then
        echo "Error: no se encontró la carpeta del atlas '$a' en $ruta_atlas" >&2
        echo "Debería existir en este monorepo; verifica que el checkout esté completo." >&2
        exit 1
    fi
done

# --- Validación: --entidad solo con un atlas ---
declare -a entidades=()
if [ -n "$entidad_arg" ]; then
    IFS=',' read -r -a entidades <<< "$entidad_arg"
    if [ "${#alias_pedidos[@]}" -gt 1 ]; then
        echo "Error: --entidad solo se puede usar con un único atlas." >&2
        exit 1
    fi
fi

# --- Validación: carpetas de --entidad existen dentro del atlas ---
if [ -n "$entidad_arg" ]; then
    carpeta_atlas="${atlas_registrados[${alias_pedidos[0]}]}"
    ruta_skills="$raiz_atlas/$carpeta_atlas/skills"
    skills_disponibles="$(ls "$ruta_skills")"
    for e in "${entidades[@]}"; do
        if ! grep -qx "$e" <<< "$skills_disponibles"; then
            echo "Error: la skill '$e' no existe en $ruta_skills" >&2
            echo "Skills disponibles: $(echo "$skills_disponibles" | tr '\n' ' ')" >&2
            exit 1
        fi
    done
fi

# --- Resolver destino efectivo ---
if [[ "$destino" = /* ]]; then
    destino_efectivo="$destino"
elif [ "$modo_global" -eq 1 ]; then
    destino_efectivo="$HOME/$destino"
else
    destino_efectivo="$(pwd)/$destino"
fi

# --- Actualizar repos fuente (y este repo) antes de copiar ---
if [ "$actualizar" -eq 1 ]; then
    echo "Actualizando el monorepo (Sistema Atlas Colombia)..."
    if ! git -C "$raiz_sistema" pull; then
        echo "Advertencia: git pull falló en $raiz_sistema, se continúa con la versión local." >&2
    fi
fi

# --- Copia ---
mkdir -p "$destino_efectivo"

copiar_skill_exacta() {
    local origen="$1" nombre="$2" destino_skill
    if ! [[ "$nombre" =~ ^[a-z0-9-]+$ ]]; then
        echo "Error: nombre de skill no seguro '$nombre'." >&2
        exit 1
    fi
    destino_skill="$destino_efectivo/$nombre"
    rm -rf -- "$destino_skill"
    cp -R -- "$origen" "$destino_skill"
}

declare -a instaladas_skill=()
declare -a instaladas_atlas=()

for a in "${alias_pedidos[@]}"; do
    carpeta="${atlas_registrados[$a]}"
    ruta_skills="$raiz_atlas/$carpeta/skills"

    if [ -n "$entidad_arg" ]; then
        for e in "${entidades[@]}"; do
            copiar_skill_exacta "$ruta_skills/$e" "$e"
            instaladas_skill+=("$e")
            instaladas_atlas+=("$a")
        done
    else
        for dir in "$ruta_skills"/*/; do
            nombre="$(basename "$dir")"
            copiar_skill_exacta "$dir" "$nombre"
            instaladas_skill+=("$nombre")
            instaladas_atlas+=("$a")
        done
    fi
done

# --- Regla de composición: 2+ atlas => copiar también la orquestadora nacional ---
if [ "${#alias_pedidos[@]}" -gt 1 ]; then
    ruta_orquestador="$raiz_sistema/atlas/nacional/skills/atlas-orquestador-colombia"
    copiar_skill_exacta "$ruta_orquestador" "atlas-orquestador-colombia"
    instaladas_skill+=("atlas-orquestador-colombia")
    instaladas_atlas+=("sistema-atlas-colombia")
fi

# --- Higiene: aviso de carpeta vieja sin sufijo de sector ---
ruta_vieja="$destino_efectivo/atlas-orquestador"
if [ -d "$ruta_vieja" ]; then
    echo ""
    echo "Advertencia: se encontró '$ruta_vieja', de una versión anterior de la orquestadora." >&2
    echo "Si ya no la necesitas, bórrala manualmente con:" >&2
    echo "  rm -rf '$ruta_vieja'" >&2
fi

# --- Reporte final ---
echo ""
echo "Skills instaladas en $destino_efectivo :"
for i in "${!instaladas_skill[@]}"; do
    echo "  - ${instaladas_skill[$i]} (de ${instaladas_atlas[$i]})"
done
echo ""
echo "Verifica la instalación con /skills en Claude Code."
