#!/usr/bin/env bash
set -euo pipefail

raiz="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
temporal="$(mktemp -d)"
trap 'rm -rf "$temporal"' EXIT

preparar() {
    rm -rf "$temporal/caso"
    mkdir -p "$temporal/caso"
    cp "$raiz/verificar-conformidad.sh" "$temporal/caso/"
    cp -R "$raiz/atlas" "$temporal/caso/atlas"
}

debe_pasar() {
    local nombre="$1"
    shift
    if ! "$@"; then
        printf 'FALLA prueba: %s debía pasar\n' "$nombre" >&2
        exit 1
    fi
}

debe_fallar() {
    local nombre="$1"
    shift
    if "$@"; then
        printf 'FALLA prueba: %s debía fallar\n' "$nombre" >&2
        exit 1
    fi
}

preparar
debe_pasar "estado real" "$temporal/caso/verificar-conformidad.sh"

preparar
sed -i 's/name: atlas-orquestador-ambiental/name: nombre-incorrecto/' \
    "$temporal/caso/atlas/ambiental/skills/atlas-orquestador-ambiental/SKILL.md"
debe_fallar "frontmatter divergente" \
    "$temporal/caso/verificar-conformidad.sh" ambiental

preparar
printf '\n[Enlace cruzado](../minero-energetico/README.md)\n' \
    >> "$temporal/caso/atlas/ambiental/README.md"
debe_fallar "enlace relativo entre atlas" \
    "$temporal/caso/verificar-conformidad.sh" ambiental

preparar
rm -rf "$temporal/caso/atlas/ambiental/skills"
mkdir -p "$temporal/caso/atlas/ambiental/skills"
debe_fallar "atlas registrado vaciado" \
    "$temporal/caso/verificar-conformidad.sh" ambiental

printf 'Pruebas adversariales de conformidad: OK\n'
