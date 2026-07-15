<div align="center">
  <img src="assets/Logo_sistema_atlas.svg" width="250" alt="Sistema Atlas Colombia">
  <h1>Sistema Atlas Colombia</h1>
  <p><em>Marco común y registro abierto de atlas sectoriales: la red que conecta las rutas hacia la información pública de Colombia.</em></p>
  <table>
    <tr>
      <td align="center" width="180">
        <a href="https://github.com/Nicolas9714/atlas-minero-energetico-colombia">
          <img src="assets/logo_atlas_anmec.svg" width="90" alt="ANMEC"><br>
          <strong>ANMEC</strong>
        </a><br>
        <sub>Atlas de Navegación<br>Minero Energético</sub>
      </td>
      <td align="center" width="180">
        <a href="https://github.com/Nicolas9714/atlas-ambiental-colombia">
          <img src="assets/Logo_atlas_anac.svg" width="90" alt="ANAC"><br>
          <strong>ANAC</strong>
        </a><br>
        <sub>Atlas de Navegación<br>Ambiental</sub>
      </td>
    </tr>
  </table>
</div>

---

Sistema Atlas Colombia es un proyecto abierto e independiente. Es el nodo que articula los Atlas de Navegación sectoriales de Colombia: define el estándar que comparten, registra qué atlas existen y qué entidades cubre cada uno, y orquesta las consultas que cruzan de un sector a otro.

Cada Atlas de Navegación es una colección abierta de skills — archivos Markdown instalables en agentes y herramientas de IA (Claude Code, Codex, Claude.ai, ChatGPT, entre otras) — que documentan cómo encontrar, usar y apropiar la información pública de un sector. Una skill por entidad, más una skill orquestadora que coordina las consultas que cruzan entidades del sector. Este repositorio agrega la capa siguiente: la skill que coordina las consultas que cruzan atlas.

## El problema que resuelve

Las skills de cada atlas documentan las rutas hacia la información pública de su sector: qué entidad consultar, qué sistema priorizar, qué fuente contrastar. Pero muchas preguntas reales no respetan las fronteras sectoriales — un proyecto minero necesita licencias ambientales; un parque eólico se monta sobre estudios hidrometeorológicos. Este repositorio resuelve esas consultas de frontera: sabe qué atlas existe para cada sector y enruta cada parte de la consulta al atlas competente.

Además publica el estándar con el que se construyen los atlas, para que cualquier persona pueda crear uno nuevo — de otro sector o de otro país — compatible con la red.

## Atlas registrados

| Atlas | Sigla | Sector | Entidades | Repositorio |
| --- | --- | --- | --- | --- |
| Atlas de Navegación Minero Energético de Colombia | ANMEC | Minero energético | 12 | [atlas-minero-energetico-colombia](https://github.com/Nicolas9714/atlas-minero-energetico-colombia) |
| Atlas de Navegación Ambiental de Colombia | ANAC | Ambiental | 7 | [atlas-ambiental-colombia](https://github.com/Nicolas9714/atlas-ambiental-colombia) |

El detalle de entidades y fronteras temáticas vive en [`registro.md`](registro.md).

## Qué contiene este repositorio

```text
sistema-atlas-colombia/
├── registro.md       → Atlas existentes, entidades de cada uno, fronteras temáticas
├── skills/
│   └── atlas-orquestador-colombia/  → Skill que enruta consultas entre atlas
├── estandar/
│   ├── especificacion.md            → El estándar de los atlas (versionado)
│   └── templates/                   → Plantillas para construir nuevas skills
└── examples/
    └── consultas-de-ejemplo.md      → Consultas que cruzan atlas, con su ruta esperada
```

## Cómo usar la skill orquestadora nacional

`atlas-orquestador-colombia` solo es útil si tienes instalados dos o más atlas. Cada atlas funciona completo por sí solo; esta skill agrega el enrutamiento entre ellos.

1. Instala los atlas que necesites siguiendo el README de cada uno.
2. Copia `skills/atlas-orquestador-colombia/` a la carpeta de skills de tu herramienta (`.claude/skills/` en Claude Code, `.agents/skills/` en Codex).
3. Pregunta en lenguaje natural. Cuando la consulta cruce sectores, la skill identifica qué parte responde cada atlas.

## Cómo crear un atlas nuevo

1. Lee [`estandar/especificacion.md`](estandar/especificacion.md) — distingue lo obligatorio de lo recomendado.
2. Usa las plantillas de [`estandar/templates/`](estandar/templates/) para las skills de entidad.
3. Cuando el atlas esté publicado, propón su registro con un pull request a [`registro.md`](registro.md).

## Licencia

Ver [LICENSE](LICENSE).
