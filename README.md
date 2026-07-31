<div align="center">
  <img src="assets/Logo_sistema_atlas.svg" width="250" alt="Sistema Atlas Colombia">
  <h1>Sistema Atlas Colombia</h1>
  <p><em>Marco común y registro abierto de atlas sectoriales: el sistema que conecta las rutas hacia la información pública de Colombia.</em></p>
  <table>
    <tr>
      <td align="center" width="180">
        <a href="atlas/minero-energetico/">
          <img src="atlas/minero-energetico/assets/logo-atlas-minero-energetico.svg" width="90" alt="Atlas de Navegación Minero Energético de Colombia"><br>
          <strong>Atlas de Navegación<br>Minero Energético<br>de Colombia</strong>
        </a>
      </td>
      <td align="center" width="180">
        <a href="atlas/ambiental/">
          <img src="atlas/ambiental/assets/logo-atlas-ambiental.svg" width="90" alt="Atlas de Navegación Ambiental de Colombia"><br>
          <strong>Atlas de Navegación<br>Ambiental<br>de Colombia</strong>
        </a>
      </td>
    </tr>
  </table>
</div>

---

Sistema Atlas Colombia es un proyecto abierto que busca democratizar el acceso a la información pública de Colombia. Este proyecto parte de la convicción de que hacer pública la información también implica hacer públicas sus rutas y conexiones. Gran parte de la información ya es accesible en portales web, micrositios, sistemas de información, geovisores, entre otros. Pero saber navegar esta información — dónde buscar, qué priorizar, qué ignorar, qué fuente contrastar — es un conocimiento práctico que suele permanecer invisible, acumulado en la experiencia de quienes conocen cada sector. 

Cada Atlas de Navegación convierte ese saber en una estructura abierta, documentada y reutilizable que opera directamente en herramientas y modelos de IA.

## Cómo funciona

El Sistema Atlas representa el nodo que articula y coordina los Atlas de Navegación sectoriales de Colombia: define el estándar que comparten, registra qué atlas existen y qué entidades cubre cada uno, y orquesta las consultas que cruzan de un sector a otro.

Cada Atlas de Navegación es una colección abierta de skills que documentan y sistematizan cómo encontrar, usar y apropiar la información pública de un sector.

A cada entidad le corresponde una skill, y a cada atlas una skill orquestadora que coordina las consultas que cruzan entidades de un mismo sector. Este repositorio agrega una capa adicional: la skill que coordina las consultas que cruzan atlas (inter-atlas). Cómo se construye cada skill está definido en la [especificación](estandar/especificacion.md).

Esta estructura permite que las skills por entidad y los atlas puedan funcionar de forma modular e independiente, y, además, de forma integrada.  

Cada nivel enruta hacia abajo sin reemplazarlo. La respuesta e información específica siempre vive en la skill de la entidad. Si solo tienes un atlas instalado, todo sigue funcionando — el atlas resuelve su sector y te señala dónde vive el resto.

## Atlas registrados

| Atlas | Sector | Entidades | Repositorio |
| --- | --- | --- | --- |
| Atlas de Navegación Minero Energético de Colombia | Minero energético | 12 | [`atlas/minero-energetico/`](atlas/minero-energetico/) |
| Atlas de Navegación Ambiental de Colombia | Ambiental | 7 | [`atlas/ambiental/`](atlas/ambiental/) |

<img src="assets/estructura-sistema-atlas.svg" width="100%" alt="Árbol de la estructura del Sistema Atlas Colombia">

El trazo discontinuo marca los atlas en construcción: el Intersectorial y el de Transporte tienen sus entidades definidas, pero todavía no sus skills ni su orquestadora, así que aún no se registran arriba.

El detalle de entidades y fronteras temáticas vive en [`registro.md`](registro.md).

## Qué contiene este repositorio

```text
sistema-atlas-colombia/
├── registro.md       → Atlas existentes, entidades de cada uno, fronteras temáticas
├── instalar.ps1 / instalar.sh       → Instaladores de skills (interfaces equivalentes)
├── estandar/
│   ├── especificacion.md            → El estándar de los atlas (versionado)
│   └── templates/                   → Plantillas para construir nuevas skills
├── atlas/
│   ├── nacional/         → Nodo nacional: atlas-orquestador-colombia (enruta ENTRE atlas)
│   ├── ambiental/        → Atlas ambiental: README propio + skills/ + examples/
│   ├── minero-energetico/ → Atlas minero energético: README propio + skills/ + examples/
│   ├── intersectorial/   → Entidades transversales (DANE, DNP, …) — en construcción
│   └── transporte/       → Sector transporte (MinTransporte, ANI, INVÍAS, …) — en construcción
└── examples/
    └── consultas-de-ejemplo.md      → Consultas que cruzan atlas, con su ruta esperada
```

## Instalación

Instala uno, varios o todos los atlas con un solo comando. Cada atlas funciona completo por sí solo; al instalar dos o más, se agrega automáticamente `atlas-orquestador-colombia`, la skill que enruta las consultas entre atlas.

### Instalación con script

Clona el monorepo junto a tu proyecto:

```bash
git clone https://github.com/Nicolas9714/sistema-atlas-colombia.git
```

Un solo comando ejecutado desde la raíz de tu proyecto instala los atlas que pidas — y, si son dos o más, agrega automáticamente la orquestadora nacional:

> El repo clonado y la copia en tu proyecto cumplen roles distintos: el clon es la fuente, que actualizas con `git pull` (o con `-Actualizar` / `--actualizar` al instalar); la copia en tu carpeta de skills es la instalación, que tu proyecto controla y que solo cambia cuando decides reinstalar.
>
> Al reinstalar, cada skill solicitada se reemplaza de forma exacta para retirar archivos obsoletos. Conserva tus personalizaciones fuera de las carpetas instaladas o respáldalas antes de ejecutar nuevamente el instalador.

```powershell
# Windows (PowerShell)
..\sistema-atlas-colombia\instalar.ps1 -Atlas todos
```

```bash
# macOS / Linux / Git Bash
../sistema-atlas-colombia/instalar.sh --atlas todos
```

**Opciones** (PowerShell / bash):

| Qué hace | PowerShell | Bash |
| --- | --- | --- |
| Elige atlas específicos | `-Atlas ambiental,minero-energetico` | `--atlas ambiental,minero-energetico` |
| Instala una sola skill de entidad | `-Entidad navegar-anla` | `--entidad navegar-anla` |
| Instala para Codex en vez de Claude Code | `-Destino .agents\skills` | `--destino .agents/skills` |
| Instala en tu carpeta de usuario (global) | `-Global` | `--global` |
| Hace `git pull` del monorepo antes de copiar | `-Actualizar` | `--actualizar` |

`-Entidad` / `--entidad` solo se puede usar con un único atlas en `-Atlas`.

Los pasos siguientes muestran la instalación manual equivalente.

### Instalación manual

Copia las skills de cada atlas desde su subcarpeta del monorepo a la carpeta de skills de tu herramienta. Para el atlas ambiental en Claude Code:

macOS / Linux / Git Bash:

```bash
cp -r sistema-atlas-colombia/atlas/ambiental/skills/* .claude/skills/
```

Windows (PowerShell):

```powershell
Copy-Item -Recurse -Force `
  "sistema-atlas-colombia\atlas\ambiental\skills\*" `
  ".claude\skills\"
```

Cambia `ambiental` por `minero-energetico` para el otro atlas, y `.claude\skills` por `.agents\skills` (Codex) u `.opencode\skills` (OpenCode) según tu herramienta. Si ya tenés skills en `.claude/skills/`, OpenCode también las lee, sin necesidad de duplicar.

Si instalas dos o más atlas, agrega también la orquestadora nacional desde `atlas/nacional/`:

```bash
cp -r sistema-atlas-colombia/atlas/nacional/skills/atlas-orquestador-colombia .claude/skills/
```

Para instalación global, usa la carpeta del usuario en vez del proyecto (`~/.claude/skills/`, `~/.agents/skills/`, `~/.opencode/skills/`; en Windows `~` corresponde a `$env:USERPROFILE`).

> **Claude.ai / ChatGPT (no recomendada):** solo como referencia — Claude.ai: *Personalizar* → *Skills* → *Añadir* → *Cargar una habilidad*; ChatGPT: *Complementos* → *Habilidades* → *Subir desde tu ordenador* (si no reconoce la skill en el chat normal, cambiá a modo *Work*).

### Pregunta en lenguaje natural

Cuando la consulta cruce sectores, la skill identifica qué parte responde cada atlas y en qué orden:

> - «¿Qué títulos y solicitudes mineras existen en el suroeste de Antioquia, qué potencial geológico tiene la zona y qué restricciones ambientales la limitan?»
> - «¿Qué proyectos de hidrocarburos con licencia activa operan en el Magdalena Medio, qué obligaciones ambientales tienen y qué muestra el monitoreo de sus cuencas?»
> - «¿Cuánta capacidad solar y eólica entró en operación frente a la meta 6GW, qué proyectos siguen en licenciamiento y cuánto generan los que ya operan?»

Las rutas esperadas de estas consultas viven en [`examples/consultas-de-ejemplo.md`](examples/consultas-de-ejemplo.md).

## Para quién

- investigadores y estudiantes que cruzan sectores en un mismo análisis
- analistas y consultores de proyectos con componentes técnicos 
- funcionarios públicos que coordinan información entre entidades
- equipos y personas que quieran construir un atlas nuevo sobre el estándar

## Cómo crear un atlas nuevo

1. Lee [`estandar/especificacion.md`](estandar/especificacion.md) — distingue lo obligatorio (N1–N5) de lo recomendado. Un atlas es compatible cumpliendo solo lo obligatorio.
2. Usa las plantillas de [`estandar/templates/`](estandar/templates/) para las skills de entidad, y los dos atlas registrados como referencia de buenas prácticas.
3. Comprueba la conformidad con `bash verificar-conformidad.sh <alias>` antes de proponer nada. Ver [Cómo se comprueba la conformidad](#cómo-se-comprueba-la-conformidad).
4. Cuando el atlas esté publicado, propón su registro con un pull request a [`registro.md`](registro.md), declarando la versión del estándar que cumple y agregando su tarjeta al banner de este README.

El Sistema Atlas Colombia de este repositorio captura el hecho de que la información pública se organiza según las competencias de las instituciones que la producen, y los problemas reales suelen abarcar varias: por eso cada atlas nuevo amplía lo que el Sistema puede responder.

El estándar aplica a cualquier sector — agro, salud, transporte — y a cualquier país: un nodo nacional de otro país puede usar esta misma estructura y los sistemas nacionales que comparten el estándar formarían, entre sí, una red.

## Cómo se comprueba la conformidad

El estándar trae su propia implementación de referencia: [`verificar-conformidad.sh`](verificar-conformidad.sh), que revisa la parte normativa (N1–N5 y autocontención) sin tocar la recomendada.

```bash
bash verificar-conformidad.sh            # todos los atlas
bash verificar-conformidad.sh ambiental  # uno solo
```

Sale con código 0 cuando no hay fallas y 1 cuando algún atlas incumple. Cada atlas se examina como si fuera la raíz de su propio repositorio, sin asumir nada del resto del árbol, de modo que el mismo chequeo vale para un atlas suelto y para uno alojado en `atlas/<sector>/`.

Hay tres modos de evaluación:

| Estado del atlas | Qué se le exige | Resultado |
|---|---|---|
| Sectorial poblado | N1–N5 y autocontención | conforme / no conforme |
| Nodo nacional | Solo su orquestadora (N1 y N2 no aplican) | conforme / no conforme |
| En construcción | Carpetas marcador bien nombradas y vacías | omitido |

Un atlas cuenta como «en construcción» cuando figura en la lista `EN_CONSTRUCCION` del script. La lista es explícita a propósito, para que un atlas que se despueble por error falle en vez de pasar por pendiente. Al crear un atlas nuevo hay que añadirlo ahí y a la nota de [`registro.md`](registro.md), y retirarlo de ambas cuando quede poblado.

[`tests/probar-verificar-conformidad.sh`](tests/probar-verificar-conformidad.sh) acompaña al verificador con pruebas adversariales: sabotean el repositorio sobre una copia temporal —nombres divergentes, enlaces entre atlas, skills vaciadas, entidades a medio poblar— y exigen que el verificador lo detecte. Sin ellas, un verificador que aprobara todo también saldría en verde.

[`.github/workflows/conformidad.yml`](.github/workflows/conformidad.yml) corre ambos en cada push y cada pull request a `main`.

## Contribuir

Ver [CONTRIBUTING.md](CONTRIBUTING.md): cómo registrar un atlas, proponer cambios al estándar o mejorar el enrutamiento entre atlas.

## Licencia

Ver [LICENSE](LICENSE).
