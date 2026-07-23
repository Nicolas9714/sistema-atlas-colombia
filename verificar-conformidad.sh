#!/usr/bin/env bash
#
# Verifica que cada atlas bajo atlas/ cumpla la parte normativa del estándar
# (N1-N5 + autocontención), tratando cada carpeta de atlas como si fuera la
# raíz de su propio repositorio — sin asumir nada del resto del árbol.
#
# Detalle normativo: estandar/especificacion.md.
#
# Uso:
#   ./verificar-conformidad.sh              # verifica todos los atlas
#   ./verificar-conformidad.sh ambiental    # verifica solo un atlas (alias)
#
# Sale con código 0 si no hay fallas; 1 si algún atlas no es conforme.
# Los atlas "en construcción" (skills marcador sin poblar, sin orquestadora)
# se omiten: no cuentan como conformes ni como fallas, sino como pendientes.

set -u

raiz="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
raiz_atlas="$raiz/atlas"

# Alias del nodo nacional: caso especial, no es un atlas sectorial.
NACIONAL="nacional"

# Contadores globales
conformes=0
en_construccion=0
con_fallas=0

# Fallas del atlas en curso (se vacía por atlas)
fallas_atlas=()

falla() { fallas_atlas+=("$1"); }

# --- Chequeos N sobre un atlas sectorial ya poblado ---
# $1 = alias, $2 = ruta al atlas
verificar_sectorial() {
    local alias="$1" ruta="$2"
    local skills="$ruta/skills"
    fallas_atlas=()

    # Recolectar carpetas de skills
    local orquestadoras=() entidades=()
    local d nombre
    for d in "$skills"/*/; do
        [ -d "$d" ] || continue
        nombre="$(basename "$d")"
        case "$nombre" in
            atlas-orquestador-*) orquestadoras+=("$nombre") ;;
            navegar-*)           entidades+=("$nombre") ;;
            *)                   falla "N2: carpeta de skill '$nombre' no es orquestadora ni entidad navegar-*" ;;
        esac
    done

    # --- N3: exactamente una orquestadora, nombrada atlas-orquestador-<alias>, con SKILL.md ---
    local orq_skill=""
    if [ "${#orquestadoras[@]}" -eq 0 ]; then
        falla "N3: no hay skill orquestadora atlas-orquestador-$alias"
    elif [ "${#orquestadoras[@]}" -gt 1 ]; then
        falla "N3: hay más de una orquestadora (${orquestadoras[*]})"
    else
        local orq="${orquestadoras[0]}"
        if [ "$orq" != "atlas-orquestador-$alias" ]; then
            falla "N3: la orquestadora se llama '$orq', se esperaba 'atlas-orquestador-$alias'"
        fi
        orq_skill="$skills/$orq/SKILL.md"
        [ -f "$orq_skill" ] || { falla "N3: falta $orq/SKILL.md"; orq_skill=""; }
    fi

    # --- N1 + N2 por entidad ---
    local pendientes=() pobladas=0
    local e req faltan tiene
    for e in "${entidades[@]}"; do
        # N2: patrón navegar-<minúsculas/números/guiones>
        if ! [[ "$e" =~ ^navegar-[a-z0-9-]+$ ]]; then
            falla "N2: '$e' no cumple el patrón navegar-<entidad>"
        fi
        # N1: tres archivos. 0 de 3 = marcador (pendiente); 1-2 = roto; 3 = ok
        tiene=0; faltan=""
        for req in SKILL.md mapa-web.md fuentes-prioritarias.md; do
            if [ -f "$skills/$e/$req" ]; then tiene=$((tiene+1)); else faltan="$faltan $req"; fi
        done
        if [ "$tiene" -eq 3 ]; then
            pobladas=$((pobladas+1))
        elif [ "$tiene" -eq 0 ]; then
            pendientes+=("$e")
        else
            falla "N1: '$e' incompleta, faltan:$faltan"
        fi
    done

    # --- N4: la orquestadora no reproduce verbatim líneas largas / URLs de las entidades ---
    # Un solo awk extrae las líneas significativas (>80 chars o con URL, sin
    # encabezados/tablas/code fences) y un solo grep busca si alguna aparece en
    # la orquestadora. Evita spawnear un subproceso por línea.
    if [ -n "$orq_skill" ] && [ "$pobladas" -gt 0 ]; then
        local tmp_sig dup
        tmp_sig="$(mktemp)"
        # (a) líneas de prosa largas (>80 chars) copiadas verbatim, sin
        #     encabezados/tablas/code fences/citas
        awk '
            { l=$0; sub(/^[ \t]+/,"",l) }
            l=="" { next }
            l ~ /^#/ || l ~ /^\|/ || l ~ /^```/ || l ~ /^>/ { next }
            length(l) > 80 { print l }
        ' "$skills"/navegar-*/mapa-web.md "$skills"/navegar-*/fuentes-prioritarias.md 2>/dev/null > "$tmp_sig"
        # (b) URLs de las entidades: la orquestadora no debe reproducir ninguna
        grep -hoE 'https?://[^ )"'"'"'<>]+' "$skills"/navegar-*/mapa-web.md "$skills"/navegar-*/fuentes-prioritarias.md 2>/dev/null >> "$tmp_sig"
        sort -u "$tmp_sig" -o "$tmp_sig"
        if [ -s "$tmp_sig" ]; then
            dup="$(grep -Ff "$tmp_sig" "$orq_skill" 2>/dev/null | head -1)"
            if [ -n "$dup" ]; then
                dup="${dup#"${dup%%[![:space:]]*}"}"
                falla "N4: la orquestadora reproduce contenido/URL de una entidad: '${dup:0:60}...'"
            fi
        fi
        rm -f "$tmp_sig"
    fi

    # --- N5: la orquestadora referencia el nodo nacional ---
    if [ -n "$orq_skill" ]; then
        if ! grep -qi 'nacional' "$orq_skill"; then
            falla "N5: la orquestadora no referencia el nodo nacional (atlas/nacional/)"
        fi
    fi

    # --- Autocontención: ningún archivo referencia otro atlas sectorial ---
    local y otros_alias
    for otros_alias in "$raiz_atlas"/*/; do
        y="$(basename "$otros_alias")"
        [ "$y" = "$alias" ] && continue
        [ "$y" = "$NACIONAL" ] && continue   # referenciar el nodo nacional está permitido (N5)
        local ac
        ac="$(grep -rIl -e "atlas/$y/" -e "$y-colombia" "$ruta" 2>/dev/null)"
        if [ -n "$ac" ]; then
            local arch
            while IFS= read -r arch; do
                falla "Autocontención: ${arch#"$raiz"/} referencia el atlas '$y'"
            done <<< "$ac"
        fi
    done

    # --- Reporte del atlas ---
    printf '\natlas/%s/  [SECTORIAL]\n' "$alias"
    if [ "${#pendientes[@]}" -gt 0 ]; then
        printf '  Entidades pendientes de poblar (marcador): %s\n' "${pendientes[*]}"
    fi
    if [ "${#fallas_atlas[@]}" -eq 0 ]; then
        printf '  N1-N5 + autocontención ........ OK (%s entidad[es] poblada[s])\n' "$pobladas"
        printf '  -> CONFORME\n'
        conformes=$((conformes+1))
    else
        local msg
        for msg in "${fallas_atlas[@]}"; do printf '  FALLA %s\n' "$msg"; done
        printf '  -> NO CONFORME\n'
        con_fallas=$((con_fallas+1))
    fi
}

# --- Nodo nacional: caso especial ---
verificar_nacional() {
    local ruta="$raiz_atlas/$NACIONAL"
    fallas_atlas=()
    local orq="$ruta/skills/atlas-orquestador-colombia"
    printf '\natlas/%s/  [NODO NACIONAL]\n' "$NACIONAL"
    if [ ! -d "$orq" ]; then
        falla "N3: falta skills/atlas-orquestador-colombia"
    elif [ ! -f "$orq/SKILL.md" ]; then
        falla "N3: falta atlas-orquestador-colombia/SKILL.md"
    fi
    if [ "${#fallas_atlas[@]}" -eq 0 ]; then
        printf '  N3 orquestadora nacional ...... OK (atlas-orquestador-colombia)\n'
        printf '  (N1/N2 no aplican: el nodo no tiene entidades sectoriales)\n'
        printf '  -> CONFORME\n'
        conformes=$((conformes+1))
    else
        local msg
        for msg in "${fallas_atlas[@]}"; do printf '  FALLA %s\n' "$msg"; done
        printf '  -> NO CONFORME\n'
        con_fallas=$((con_fallas+1))
    fi
}

# --- ¿El atlas sectorial está poblado o en construcción? ---
# En construcción = sin orquestadora Y sin ninguna entidad con sus 3 archivos.
esta_poblado() {
    local ruta="$1"
    local skills="$ruta/skills"
    ls "$skills"/atlas-orquestador-* >/dev/null 2>&1 && return 0
    local e
    for e in "$skills"/navegar-*/; do
        [ -d "$e" ] || continue
        if [ -f "$e/SKILL.md" ] && [ -f "$e/mapa-web.md" ] && [ -f "$e/fuentes-prioritarias.md" ]; then
            return 0
        fi
    done
    return 1
}

verificar_atlas() {
    local alias="$1"
    local ruta="$raiz_atlas/$alias"
    if [ ! -d "$ruta" ]; then
        printf 'Error: no existe atlas/%s/\n' "$alias" >&2
        con_fallas=$((con_fallas+1))
        return
    fi
    if [ "$alias" = "$NACIONAL" ]; then
        verificar_nacional
        return
    fi
    if esta_poblado "$ruta"; then
        verificar_sectorial "$alias" "$ruta"
    else
        printf '\natlas/%s/  [EN CONSTRUCCIÓN]\n' "$alias"
        printf '  Sin orquestadora y sin entidades pobladas; skills marcador a la espera.\n'
        printf '  -> OMITIDO (pendiente de poblar)\n'
        en_construccion=$((en_construccion+1))
    fi
}

# --- Main ---
printf 'Verificación de conformidad — Sistema Atlas Colombia\n'
printf '=====================================================\n'

if [ $# -ge 1 ]; then
    verificar_atlas "$1"
else
    for d in "$raiz_atlas"/*/; do
        verificar_atlas "$(basename "$d")"
    done
fi

printf '\n=====================================================\n'
printf 'Resultado: %s conforme(s), %s en construcción, %s con fallas.\n' \
    "$conformes" "$en_construccion" "$con_fallas"

[ "$con_fallas" -eq 0 ]
