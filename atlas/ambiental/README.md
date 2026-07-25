<div align="center">
  <img src="assets/logo-atlas-ambiental.svg" width="250" alt="Atlas de Navegación Ambiental de Colombia">
  <h1>Atlas de Navegación Ambiental de Colombia</h1>
  <p><em>Colección abierta de skills para encontrar, usar y apropiar la información pública del sector ambiental colombiano.</em></p>
</div>

---

## El problema que resuelve

La información del sector ambiental colombiano está distribuida entre múltiples sitios institucionales, micrositios, sistemas de información, geovisores, portales de datos, normas y documentos. Aunque gran parte de esta información es pública, encontrarla, interpretarla y utilizarla no siempre es sencillo. Cada entidad organiza sus contenidos de manera diferente y muchas fuentes permanecen ocultas en subdominios, plataformas externas, menús poco claros o rutas difíciles de identificar.

Este atlas parte de la convicción de que hacer pública la información también implica hacer públicas sus rutas y conexiones. Saber navegar en este ecosistema conlleva saber dónde buscar, qué ignorar, qué ruta seguir, qué portal priorizar, qué entidad consultar, qué sección omitir y qué fuente contrastar. Ese saber constituye una forma de conocimiento práctico que suele permanecer invisible, acumulado en la experiencia de quienes conocen el sector y sus sistemas de información.

Así, el atlas convierte ese conocimiento disperso en una primera estructura abierta, documentada y reutilizable. A través de sus skills, permite identificar dónde buscar, qué fuentes priorizar y cómo orientarse dentro del complejo ecosistema institucional del sector ambiental colombiano.

Este atlas hace parte del [Sistema Atlas Colombia](../../README.md) y cumple la versión v0.1 de su [especificación](../../estandar/especificacion.md).

## Entidades cubiertas

**Skill orquestadora:** `atlas-orquestador-ambiental` — coordina consultas temáticas e interinstitucionales entre las 7 skills. Necesaria al instalar el Atlas completo; no es necesaria si solo se instala una entidad.

| Skill | Entidad | Rol principal |
| --- | --- | --- |
| `navegar-minambiente` | MinAmbiente | Política ambiental nacional |
| `navegar-anla` | ANLA | Licenciamiento ambiental |
| `navegar-ideam` | IDEAM | Hidrología, meteorología y estudios ambientales |
| `navegar-iavh` | IAvH | Investigación en biodiversidad |
| `navegar-invemar` | INVEMAR | Investigación marina y costera |
| `navegar-pnn` | Parques Nacionales Naturales | Áreas protegidas |
| `navegar-ungrd` | UNGRD | Gestión del riesgo de desastres |

Cada skill de entidad contiene `SKILL.md`, `mapa-web.md` y `fuentes-prioritarias.md`; la orquestadora contiene solo `SKILL.md`.

## Ejemplos

Una vez cargada la skill, pregunta en lenguaje natural. El tipo de pregunta determina qué parte de la skill responde:

| Tipo | Cuándo usarlo | Ejemplo |
| --- | --- | --- |
| **Acceso directo** — «llévame a», «dame el link de» | Sabes qué herramienta o sistema buscas | «Llévame al geovisor de licencias ambientales de la ANLA» |
| **Exploración** — «qué tiene», «qué publica», «qué sistemas opera» | Quieres un mapa de lo que ofrece la entidad | «¿Qué información de biodiversidad publica el IAvH?» |
| **Transversal** — «qué entidad tiene», «por dónde empiezo» | No sabes qué entidad consultar o la consulta cruza varias — usa `atlas-orquestador-ambiental` como punto de entrada | «¿Qué entidad tiene los datos de calidad del agua?» |

Más ejemplos:

> - «¿Qué requisitos tiene una licencia ambiental ante la ANLA?»
> - «¿Dónde consulto el estado del tiempo y pronósticos del IDEAM?»
> - «¿Qué especies amenazadas reporta el IAvH en su Sistema de Información sobre Biodiversidad?»

## Instalación

Las skills de este atlas se instalan con el instalador del Sistema — un solo comando para uno, varios o todos los atlas. Ver [instalación en el README del Sistema Atlas Colombia](../../README.md#instalación).
