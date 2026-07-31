<div align="center">
  <img src="assets/logo-atlas-minero-energetico.svg" width="250" alt="Atlas de Navegación Minero Energético de Colombia">
  <h1>Atlas de Navegación Minero Energético de Colombia</h1>
  <p><em>Colección abierta de skills para encontrar, usar y apropiar la información pública del sector minero energético colombiano.</em></p>
</div>

---

## El problema que resuelve

La información del sector minero energético colombiano está distribuida entre múltiples sitios institucionales, micrositios, sistemas de información, geovisores, portales de datos, normas y documentos. Aunque gran parte de esta información es pública, encontrarla, interpretarla y utilizarla no siempre es sencillo. Cada entidad organiza sus contenidos de manera diferente y muchas fuentes permanecen ocultas en subdominios, plataformas externas, menús poco claros o rutas difíciles de identificar.

Este atlas parte de la convicción de que hacer pública la información también implica hacer públicas sus rutas y conexiones. Saber navegar en este ecosistema conlleva saber dónde buscar, qué ignorar, qué ruta seguir, qué portal priorizar, qué entidad consultar, qué sección omitir y qué fuente contrastar. Ese saber constituye una forma de conocimiento práctico que suele permanecer invisible, acumulado en la experiencia de quienes conocen el sector y sus sistemas de información.

Así, el atlas convierte ese conocimiento disperso en una primera estructura abierta, documentada y reutilizable. A través de sus skills, permite identificar dónde buscar, qué fuentes priorizar y cómo orientarse dentro del complejo ecosistema institucional del sector minero energético colombiano.

Este atlas hace parte del [Sistema Atlas Colombia](../../README.md) y cumple la versión v0.1 de su [especificación](../../estandar/especificacion.md).

## Entidades cubiertas

**Skill orquestadora:** `atlas-orquestador-minero-energetico` — coordina consultas temáticas e interinstitucionales entre las 12 skills. Necesaria al instalar el Atlas completo; no es necesaria si solo se instala una entidad.

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
| `navegar-ecopetrol` | Ecopetrol | Cadena de hidrocarburos e información corporativa sectorial |
| `navegar-bec` | BEC | Gestor del mercado de gas natural |

Cada skill de entidad contiene `SKILL.md`, `mapa-web.md` y `fuentes.md`; la orquestadora contiene solo `SKILL.md`.

## Ejemplos

Una vez cargada la skill, pregunta en lenguaje natural. El tipo de pregunta determina qué parte de la skill responde:

| Tipo | Cuándo usarlo | Ejemplo |
| --- | --- | --- |
| **Acceso directo** — «llévame a», «dame el link de» | Sabes qué herramienta o sistema buscas | «Llévame al geovisor de títulos mineros de la ANM» |
| **Exploración** — «qué tiene», «qué publica», «qué sistemas opera» | Quieres un mapa de lo que ofrece la entidad | «¿Qué información geológica publica el SGC?» |
| **Transversal** — «qué entidad tiene», «por dónde empiezo» | No sabes qué entidad consultar o la consulta cruza varias — usa `atlas-orquestador-minero-energetico` como punto de entrada | «¿Qué entidad tiene los datos de tarifas eléctricas?» |

Más ejemplos:

> - «¿Cuál es el marco tarifario vigente de gas natural de la CREG?»
> - «¿Qué sistema de la UPME tiene los datos de proyectos de generación?»
> - «¿Dónde consulto la producción de gas natural por campo en la ANH?»

## Instalación

Las skills de este atlas se instalan con el instalador del Sistema — un solo comando para uno, varios o todos los atlas. Ver [instalación en el README del Sistema Atlas Colombia](../../README.md#instalación).