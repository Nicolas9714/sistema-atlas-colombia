# Especificación de los Atlas de Navegación — v0.1

**Versión:** 0.1 · **Estado:** en incubación.
**Versionado:** semántico (`mayor.menor.parche`). Mientras la versión mayor sea 0, la especificación está en incubación y cualquier cambio puede exigir ajustes a los atlas registrados.
**Última actualización:** 2026-07-23 — se agregó la conformidad de layout (un atlas puede vivir como subcarpeta o como repositorio propio) y la regla de autocontención; N5 pasó a ser agnóstico del layout. El número se mantiene en v0.1 por estar el estándar en incubación y sin implementadores externos.

Un Atlas de Navegación sistematiza las rutas hacia la información pública de un sector: qué entidad consultar, qué sistema priorizar, qué fuente contrastar. Esta especificación define la forma común que ese saber toma y qué debe cumplir un atlas para ser compatible con el Sistema y registrarse en él.

## Parte normativa

Criterio: es normativo lo que rompe la interoperabilidad si falta. Un atlas que cumple los cinco puntos N1–N5 y la regla de autocontención es compatible, aunque no adopte ninguna recomendación.

### Layout conforme

Un atlas es una unidad definida por su estructura (N1–N5), no por su frontera de repositorio. Es conforme tanto si vive como repositorio propio como si vive como subcarpeta de un sistema (`atlas/<sector>/` dentro del monorepo del Sistema). Ambos layouts son equivalentes para el estándar; el registro (`registro.md`) puede listar atlas de los dos tipos.

### N1 — Tres archivos por entidad

Cada entidad cubierta se documenta en tres archivos Markdown con roles definidos:

| Archivo | Rol |
| --- | --- |
| `SKILL.md` | Descripción de la entidad y orientación general de navegación |
| `mapa-web.md` | Árbol curado del sitio oficial, reducido a su contenido misional y estratégico |
| `fuentes.md` | Inventario de sistemas, geovisores, portales, publicaciones y documentos clave |

### N2 — Convención de nombres

Las skills de entidad se nombran `navegar-<entidad>` (p. ej. `navegar-ideam`, `navegar-upme`). La carpeta de la skill contiene los tres archivos de N1.

### N3 — Skill orquestadora

Todo atlas tiene una skill orquestadora, nombrada `atlas-orquestador-<sector>` (p. ej. `atlas-orquestador-ambiental`, `atlas-orquestador-minero-energetico`), con: el mapa de skills por subsector, el procedimiento de navegación y rutas sugeridas para consultas que cruzan varias entidades del sector.

El sufijo de sector es obligatorio — nunca `atlas-orquestador` a secas — porque el nombre de cada skill debe ser único en todo el Sistema: instalar varios atlas en un mismo proyecto copia sus skills a una sola carpeta, y dos orquestadoras con el mismo nombre se sobrescribirían entre sí. Aplica tanto al nombre de la carpeta como al campo `name` del `SKILL.md`.

### N4 — Patrón de enrutamiento

El orquestador de cada nivel no reemplaza a las unidades inferiores: solo enruta hacia ellas. La especificidad vive abajo — la orquestadora no duplica URLs ni contenido de las skills de entidad; el nodo nacional no duplica el contenido de los atlas.

### N5 — Línea vertical

La skill orquestadora de cada atlas incluye una línea estandarizada apuntando al nodo nacional del Sistema (`atlas/nacional/`), para consultas que cruzan a otros sectores. El enlace se resuelve según el layout: con la ruta relativa correcta al nodo nacional si el atlas vive como subcarpeta del monorepo, o con la URL del repositorio del Sistema si el atlas vive como repositorio propio.

> Para consultas que cruzan a otros sectores, el enrutamiento entre atlas vive en el nodo nacional Sistema Atlas Colombia.

### Autocontención

Nada dentro de la carpeta de un atlas referencia archivos de otro atlas. Toda frontera temática entre atlas se declara únicamente en `registro.md`, y el cruce entre sectores se resuelve por el nodo nacional (N5), nunca por un enlace directo de un atlas a los archivos de otro. La regla mantiene cada atlas extraíble y verificable de forma aislada, exista como subcarpeta o como repositorio propio.

### Prueba de compatibilidad

Un tercero debe poder construir un atlas de otro sector — o de otro país — cumpliendo solo la parte normativa (N1–N5 y autocontención), y sus skills deben poder convivir con las de los atlas registrados sin colisiones de nombres ni de competencias. En un atlas que vive como repositorio propio la autocontención se satisface por construcción, al no haber otro atlas en el mismo árbol.

Esta especificación tiene una implementación de referencia que la verifica: [`../verificar-conformidad.sh`](../verificar-conformidad.sh), que comprueba N1–N5 y la autocontención tratando cada atlas como la raíz de su propio repositorio. Correrlo sobre un atlas candidato responde la pregunta de si es compatible. La parte recomendada queda fuera de su alcance. El README del Sistema explica sus modos de evaluación y cómo se ejecuta.

## Parte recomendada

Buenas prácticas de los atlas fundadores (el Atlas de Navegación Minero Energético de Colombia y el Atlas de Navegación Ambiental de Colombia). Mejoran la calidad; su ausencia no rompe la compatibilidad.

- **Mapa web curado, no exhaustivo:** el árbol de `mapa-web.md` se reduce al contenido misional y estratégico del sitio; profundidad guiada por el valor de navegación, no por la estructura completa del sitio.
- **Tablas de fuentes con inventario tipificado:** sistemas, geovisores, portales de datos, publicaciones y documentos clave, cada uno con su URL verificada y una nota de qué resuelve.
- **Carpeta `examples/`:** una vitrina de consultas (`consultas-de-ejemplo.md`: prompt + ruta esperada, sin URLs) y casos de análisis reproducibles que recorren las capas completas del atlas.
- **Verificación en vivo:** las URLs y afirmaciones sobre sistemas se contrastan contra el sitio real antes de publicarse.
- **Reglas de competencia en la orquestadora:** cómo combinar resultados sin atribuir datos de una entidad a otra.
- **Identidad visual:** logo propio en SVG monocromo dentro de la familia visual del Sistema.

## Registro

Un atlas se registra en el Sistema mediante pull request a [`../registro.md`](../registro.md), declarando la versión de esta especificación que cumple.
