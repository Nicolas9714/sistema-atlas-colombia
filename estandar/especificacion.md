# Especificación de los Atlas de Navegación — v0.1

**Versión:** 0.1 · **Estado:** en incubación.
**Versionado:** semántico (`mayor.menor.parche`). Las correcciones de redacción que no alteran lo exigido suben el parche; las adiciones que no obligan a ajustar los atlas registrados suben la versión menor; los cambios que sí los obligan suben la versión mayor. Mientras la versión mayor sea 0, la especificación está en incubación y un cambio de versión menor también puede exigir ajustes. Es el único documento del Sistema con número de versión; el resto del repositorio evoluciona con el historial de git. La versión 1.0 se publicará cuando el estándar quede listo para adopción externa.

Un Atlas de Navegación sistematiza las rutas hacia la información pública de un sector: qué entidad consultar, qué sistema priorizar, qué fuente contrastar. Esta especificación define la forma común que ese saber toma y qué debe cumplir un atlas para ser compatible con el Sistema y registrarse en él.

## Parte normativa

Criterio: es normativo lo que rompe la interoperabilidad si falta. Un atlas que cumple estos cinco puntos es compatible, aunque no adopte ninguna recomendación.

### N1 — Tres archivos por entidad

Cada entidad cubierta se documenta en tres archivos Markdown con roles definidos:

| Archivo | Rol |
| --- | --- |
| `SKILL.md` | Descripción de la entidad y orientación general de navegación |
| `mapa-web.md` | Árbol curado del sitio oficial, reducido a su contenido misional y estratégico |
| `fuentes-prioritarias.md` | Inventario de sistemas, geovisores, portales, publicaciones y documentos clave |

### N2 — Convención de nombres

Las skills de entidad se nombran `navegar-<entidad>` (p. ej. `navegar-ideam`, `navegar-upme`). La carpeta de la skill contiene los tres archivos de N1.

### N3 — Skill orquestadora

Todo atlas tiene una skill orquestadora (`atlas-orquestador`) con: el mapa de skills por subsector, el procedimiento de navegación y rutas sugeridas para consultas que cruzan varias entidades del sector.

### N4 — Patrón de enrutamiento

El orquestador de cada nivel no reemplaza a las unidades inferiores: solo enruta hacia ellas. La especificidad vive abajo — la orquestadora no duplica URLs ni contenido de las skills de entidad; el nodo nacional no duplica el contenido de los atlas.

### N5 — Línea vertical

La skill orquestadora de cada atlas incluye una línea estandarizada apuntando al nodo nacional, para consultas que cruzan a otros sectores:

> Para consultas que cruzan a otros sectores, el enrutamiento entre atlas vive en [Sistema Atlas Colombia](https://github.com/Nicolas9714/sistema-atlas-colombia).

### Prueba de compatibilidad

Un tercero debe poder construir un atlas de otro sector — o de otro país — cumpliendo solo N1–N5, y sus skills deben poder convivir con las de los atlas registrados sin colisiones de nombres ni de competencias.

## Parte recomendada

Buenas prácticas de los atlas fundadores (el Atlas de Navegación Minero Energético de Colombia y el Atlas de Navegación Ambiental de Colombia). Mejoran la calidad; su ausencia no rompe la compatibilidad.

- **Mapa web curado, no exhaustivo:** el árbol de `mapa-web.md` se reduce al contenido misional y estratégico del sitio; profundidad guiada por el valor de navegación, no por la estructura completa del sitio.
- **Tablas de fuentes con inventario tipificado:** sistemas, geovisores, portales de datos, publicaciones y documentos clave, cada uno con su URL verificada y una nota de qué resuelve.
- **Carpeta `examples/`:** una vitrina de consultas (`consultas-de-ejemplo.md`: prompt + ruta esperada, sin URLs) y casos de análisis reproducibles que recorren las capas completas del atlas.
- **Redacción en positivo:** afirmaciones de atribución («operado por X»), sin negaciones ni menciones de fallas salvo que sean información de navegación necesaria.
- **Verificación en vivo:** las URLs y afirmaciones sobre sistemas se contrastan contra el sitio real antes de publicarse.
- **Reglas de competencia en la orquestadora:** cómo combinar resultados sin atribuir datos de una entidad a otra.
- **Identidad visual:** logo propio en SVG monocromo dentro de la familia visual del Sistema.

## Registro

Un atlas se registra en el Sistema mediante pull request a [`../registro.md`](../registro.md), declarando la versión de esta especificación que cumple.
