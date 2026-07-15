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

## El problema que resuelve

La información pública de Colombia está distribuida en cientos de sitios institucionales, sistemas de información, geovisores, portales de datos y documentos. Saber navegarla — dónde buscar, qué priorizar, qué ignorar, qué fuente contrastar — es un conocimiento práctico que suele permanecer invisible, acumulado en la experiencia de quienes conocen cada sector. Cada Atlas de Navegación convierte ese saber en una estructura abierta, documentada y reutilizable que opera directamente en herramientas de IA: el criterio de navegación de quien conoce el sector, hecho explícito, versionado y verificable.

La segunda capa del problema es estructural. La información pública se organiza según las competencias de las instituciones que la producen; las preguntas se organizan según los problemas de quien las formula, y un problema rara vez coincide con una sola competencia. Responder una consulta real exige descomponerla, resolver cada parte ante la fuente competente y recomponer el resultado respetando la autoridad de cada una. El Sistema hace operable esa descomposición: mantiene el registro de qué atlas existen y qué cubre cada uno, declara en un único lugar las fronteras temáticas entre sectores y enruta cada tramo de la consulta al atlas que puede responderlo. El estándar completa la arquitectura: define la forma común que hace interoperables los atlas y permite que la red crezca hacia nuevos sectores y otros países de manera descentralizada.

## Cómo funciona

Sistema Atlas Colombia es un proyecto abierto. Es el nodo que articula los Atlas de Navegación sectoriales de Colombia: define el estándar que comparten, registra qué atlas existen y qué entidades cubre cada uno, y orquesta las consultas que cruzan de un sector a otro.

Cada Atlas de Navegación es una colección abierta de skills — archivos Markdown instalables en agentes y herramientas de IA para código (Claude Code, Codex, entre otras) — que documentan cómo encontrar, usar y apropiar la información pública de un sector. Una skill por entidad, más una skill orquestadora que coordina las consultas que cruzan entidades del sector. Este repositorio agrega la capa siguiente: la skill que coordina las consultas que cruzan atlas. Cómo se construye cada skill está definido en la [especificación](estandar/especificacion.md).


El mismo patrón se repite en tres escalas: una unidad funciona sola, y una orquestadora opcional conecta varias.

| Escala | Unidad | Orquestadora | Qué resuelve |
| --- | --- | --- | --- |
| Entidad | Skill `navegar-*` (3 archivos: orientación, mapa web, fuentes) | — | «¿Dónde consulto los expedientes de la ANLA?» |
| Atlas | Colección de skills de un sector | `atlas-orquestador` del atlas | «¿Qué entidad del sector ambiental tiene los datos de calidad del agua?» |
| Red | Los atlas registrados | `atlas-orquestador-colombia` (este repo) | «¿Qué títulos mineros hay en la zona y qué restricciones ambientales la limitan?» |

Cada nivel enruta hacia abajo sin reemplazar lo de abajo: la respuesta específica siempre vive en la skill de la entidad. Si solo tienes un atlas instalado, todo sigue funcionando — el atlas resuelve su sector y te señala dónde vive el resto.

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

### 1. Instala los atlas

Sigue el README de cada atlas ([ANMEC](https://github.com/Nicolas9714/atlas-minero-energetico-colombia), [ANAC](https://github.com/Nicolas9714/atlas-ambiental-colombia)): clonar el repo junto a tu proyecto y copiar sus skills a la carpeta de skills de tu herramienta.

### 2. Agrega la orquestadora nacional

Clona este repositorio junto a los atlas y copia la skill:

```bash
git clone https://github.com/Nicolas9714/sistema-atlas-colombia.git
cp -r ../sistema-atlas-colombia/skills/atlas-orquestador-colombia .claude/skills/
```

En Windows, usa PowerShell:

```powershell
Copy-Item -Recurse -Force `
  "..\sistema-atlas-colombia\skills\atlas-orquestador-colombia" `
  ".claude\skills\"
```

Cambia `.claude\skills` por `.agents\skills` si estás usando Codex. En Claude.ai, ChatGPT, Gemini u otras plataformas, adjunta el `SKILL.md` de la skill o agrégalo al proyecto junto con los archivos de los atlas.

### 3. Pregunta en lenguaje natural

Cuando la consulta cruce sectores, la skill identifica qué parte responde cada atlas y en qué orden:

> - «¿Qué títulos y solicitudes mineras existen en el suroeste de Antioquia, qué potencial geológico tiene la zona y qué restricciones ambientales la limitan?»
> - «¿Qué proyectos de hidrocarburos con licencia activa operan en el Magdalena Medio, qué obligaciones ambientales tienen y qué muestra el monitoreo de sus cuencas?»
> - «¿Cuánta capacidad solar y eólica entró en operación frente a la meta 6GW, qué proyectos siguen en licenciamiento y cuánto generan los que ya operan?»

Las rutas esperadas de estas consultas viven en [`examples/consultas-de-ejemplo.md`](examples/consultas-de-ejemplo.md).

## Para quién

- investigadores y estudiantes que cruzan sectores en un mismo análisis
- analistas y consultores de proyectos con componentes técnicos y ambientales
- funcionarios públicos que coordinan entre entidades
- equipos y personas que quieran construir un atlas nuevo sobre el estándar

## Cómo crear un atlas nuevo

1. Lee [`estandar/especificacion.md`](estandar/especificacion.md) — distingue lo obligatorio (N1–N5) de lo recomendado. Un atlas es compatible cumpliendo solo lo obligatorio.
2. Usa las plantillas de [`estandar/templates/`](estandar/templates/) para las skills de entidad, y los dos atlas registrados como referencia de buenas prácticas.
3. Cuando el atlas esté publicado, propón su registro con un pull request a [`registro.md`](registro.md), declarando la versión del estándar que cumple y agregando su tarjeta al banner de este README.

El estándar aplica a cualquier sector — agro, salud, transporte — y a cualquier país: un nodo nacional de otro país usa esta misma forma sin pedir permiso ni coordinación central.

## Licencia

Ver [LICENSE](LICENSE).
