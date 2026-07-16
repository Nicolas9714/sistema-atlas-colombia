<div align="center">
  <img src="assets/logo-atlas-minero-energetico.svg" width="250" alt="Atlas de Navegación Minero Energético de Colombia">
  <h1>Atlas de Navegación Minero Energético de Colombia</h1>
  <p><em>Colección abierta de skills para encontrar, usar y apropiar la información pública del sector minero energético colombiano.</em></p>
</div>

---

## El problema que resuelve

La información del sector minero-energético colombiano está distribuida entre múltiples sitios institucionales, micrositios, sistemas de información, geovisores, portales de datos, normas y documentos. Aunque gran parte de esta información es pública, encontrarla, interpretarla y utilizarla no siempre es sencillo. Cada entidad organiza sus contenidos de manera diferente y muchas fuentes permanecen ocultas en subdominios, plataformas externas, menús poco claros o rutas difíciles de identificar.

Este atlas parte de la convicción de que hacer pública la información también implica hacer públicas sus rutas y conexiones. Saber navegar en este ecosistema conlleva saber dónde buscar, qué ignorar, qué ruta seguir, qué portal priorizar, qué entidad consultar, qué sección omitir y qué fuente contrastar. Ese saber constituye una forma de conocimiento práctico que suele permanecer invisible, acumulado en la experiencia de quienes conocen el sector y sus sistemas de información. 

Así, el atlas convierte ese conocimiento disperso en una primera estructura abierta, documentada y reutilizable. A través de sus skills, permite identificar dónde buscar, qué fuentes priorizar y cómo orientarse dentro del complejo ecosistema institucional del sector minero-energético colombiano.

Este atlas es complementario al [Atlas de Navegación Ambiental de Colombia](https://github.com/Nicolas9714/atlas-ambiental-colombia), y sigue la misma estructura y convenciones.

## Cómo usar las skills

Las skills por entidad contienen tres archivos Markdown que cubren navegación, sistemas y fuentes de información (ver [Estructura del repositorio](#estructura-del-repositorio)). La skill orquestadora `atlas-orquestador` contiene un solo archivo. Al instalar cualquier skill en tu proyecto, el agente o modelo de IA ya puede interactuar con su contenido.

La forma recomendada es mantener este Atlas como un repositorio fuente, clonado junto al proyecto donde vas a trabajar, y copiar al proyecto solo las skills que necesitas. Así el Atlas queda separado del proyecto y cada proyecto conserva solo las skills que usa.

Otra alternativa es descargar del repositorio solo las skills de interés.

Flujo básico recomendado:

1. Descarga este Atlas.
2. Ubícalo junto al proyecto donde vas a trabajar.
3. Copia el Atlas completo o solo las skills que necesitas a la carpeta de skills de tu herramienta (Claude Code, Codex, Open Code, etc.).

### 1. Descarga el Atlas

Clona el repositorio:

```bash
git clone https://github.com/Nicolas9714/atlas-minero-energetico-colombia.git
```

También puedes descargarlo como archivo ZIP desde GitHub y descomprimirlo.

Ubica el Atlas junto al proyecto donde quieras utilizar las skills:

```text
proyectos/
├── atlas-minero-energetico-colombia/
└── mi-proyecto/
```

---

### 2. Elige tu herramienta

| Herramienta | Ruta de instalación |
| --- | --- | 
| Claude Code | `.claude/skills/` |
| Codex | `.agents/skills/` |
| Claude.ai, ChatGPT, Gemini u otro | Adjunta los archivos o agrégalos al proyecto |

---

### 3. Instala el Atlas completo

Incluye `atlas-orquestador`, la skill orquestadora necesaria para consultas que cruzan varias entidades.

En Claude Code:

```bash
mkdir -p .claude/skills
cp -r ../atlas-minero-energetico-colombia/skills/* .claude/skills/
```

En Codex:

```bash
mkdir -p .agents/skills
cp -r ../atlas-minero-energetico-colombia/skills/* .agents/skills/
```

En Windows, usa PowerShell:

```powershell
New-Item -ItemType Directory -Force ".claude\skills" | Out-Null
Copy-Item -Recurse -Force `
  "..\atlas-minero-energetico-colombia\skills\*" `
  ".claude\skills\"
```

Cambia `.claude\skills` por `.agents\skills` si estás usando Codex.

### 4. Instala solo una entidad

Si solo necesitas información de una entidad específica, copia únicamente esa skill. `atlas-orquestador` no es necesaria en este caso.

En Claude Code:

```bash
mkdir -p .claude/skills
cp -r ../atlas-minero-energetico-colombia/skills/navegar-creg .claude/skills/
```

En Codex:

```bash
mkdir -p .agents/skills
cp -r ../atlas-minero-energetico-colombia/skills/navegar-creg .agents/skills/
```

Reemplaza `navegar-creg` por la entidad que quieras instalar.

En Windows, usa PowerShell:

```powershell
New-Item -ItemType Directory -Force ".claude\skills" | Out-Null
Copy-Item -Recurse -Force `
  "..\atlas-minero-energetico-colombia\skills\navegar-creg" `
  ".claude\skills\"
```

Cambia `.claude\skills` por `.agents\skills` si estás usando Codex.

### 5. Verifica la instalación

En Claude Code, inicia la herramienta desde la raíz del proyecto y escribe:

```text
/skills
```

En Codex, inicia la herramienta desde la raíz del proyecto y menciona directamente la skill instalada.

---

### Modelos de chat 

En Claude.ai, ChatGPT, Gemini u otras plataformas compatibles, puedes adjuntar la carpeta de una entidad o agregar sus archivos al proyecto correspondiente.

Cada skill incluye un `SKILL.md` como archivo principal. Las skills por entidad incluyen además `mapa-web.md` y `fuentes-prioritarias.md`.

---

### Instalación global opcional

Para usar las skills en todos tus proyectos, instálalas en las rutas globales de cada herramienta:

```text
Claude Code: ~/.claude/skills/
Codex:       ~/.agents/skills/
```

En Windows, "~" corresponde a "$env:USERPROFILE".

---

### Como base para otros proyectos

Las skills son estructuras reutilizables para:

- crear bases de conocimiento consultables por IA usando fuentes oficiales
- construir grafos de conocimiento sectorial
- diseñar automatizaciones o verificadores de enlaces
- crear asistentes especializados por entidad o tema
- documentar rutas confiables hacia datos públicos, geovisores y publicaciones oficiales

---

## Para quién

- investigadores y estudiantes
- analistas y consultores
- funcionarios públicos
- equipos técnicos y desarrolladores

---

## Entidades cubiertas

**Skill orquestadora:** `atlas-orquestador` — coordina consultas temáticas e interinstitucionales entre las 12 skills. Necesaria al instalar el Atlas completo; no es necesaria si solo se instala una entidad.

| Skill | Entidad | Rol principal |
| --- | --- | --- |
| `navegar-minenergia` | MinEnergía | Política sectorial |
| `navegar-upme` | UPME | Planeación minero-energética |
| `navegar-creg` | CREG | Regulación de energía y gas |
| `navegar-xm` | XM | Operación del sistema eléctrico |
| `navegar-anm` | ANM | Administración minera |
| `navegar-anh` | ANH | Administración de hidrocarburos |
| `navegar-sgc` | SGC | Geología y recursos del subsuelo |
| `navegar-superservicios` | Superservicios | Vigilancia de servicios públicos |
| `navegar-ipse` | IPSE | Energía en zonas no interconectadas |
| `navegar-fenoge` | FENOGE | Energías no convencionales y eficiencia |
| `navegar-ecopetrol` | Ecopetrol | Cadena de Hidrocarburos e información corporativa sectorial |
| `navegar-bec` | BEC | Gestor del mercado de gas natural |

## Estructura del repositorio

```text
atlas-minero-energetico-colombia/
├── skills/       → Una carpeta por skill: atlas-orquestador (skill orquestadora) + 12 entidades
├── examples/     → Plantilla y convenciones para casos de uso (los casos se contribuyen, ver examples/README.md)
└── templates/    → Puntero a las plantillas del Sistema Atlas Colombia
```

Las 12 skills contienen:

- `SKILL.md` — descripción de la entidad y orientación general de navegación
- `mapa-web.md` — árbol curado del sitio oficial, reducido a su contenido misional y estratégico
- `fuentes-prioritarias.md` — inventario de sistemas, geovisores, portales, publicaciones y documentos clave

`atlas-orquestador` contiene solo `SKILL.md` con el mapa de skills por subsector, el procedimiento de navegación y las rutas sugeridas.

---

## Ejemplos:

Una vez cargada la skill, pregunta en lenguaje natural. El tipo de pregunta determina qué parte de la skill responde:

| Tipo | Cuándo usarlo | Ejemplo |
| --- | --- | --- |
| **Acceso directo** — «llévame a», «dame el link de» | Sabes qué herramienta o sistema buscas | «Llévame al geovisor de títulos mineros de la ANM» |
| **Exploración** — «qué tiene», «qué publica», «qué sistemas opera» | Quieres un mapa de lo que ofrece la entidad | «¿Qué información geológica publica el SGC?» |
| **Transversal** — «qué entidad tiene», «por dónde empiezo» | No sabes qué entidad consultar o la consulta cruza varias — usa `atlas-orquestador` como punto de entrada | «¿Qué entidad tiene los datos de tarifas eléctricas?» |

Más ejemplos:

> - «¿Cuál es el marco tarifario vigente de gas natural de la CREG?»
> - «¿Qué sistema de la UPME tiene los datos de proyectos de generación?»
> - «¿Dónde consulto la producción de gas natural por campo en la ANH?»

---

## Contribuir

Ver [CONTRIBUTING.md](CONTRIBUTING.md).

## Licencia

Ver [LICENSE](LICENSE).
