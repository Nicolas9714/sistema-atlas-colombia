# Guía de contribución

Gracias por querer mejorar el Sistema Atlas Colombia. Aquí se explica cómo proponer cambios. Si tu contribución es sobre el contenido de un sector (una fuente nueva, un enlace roto, una entidad sin cubrir), ubícala en la subcarpeta del atlas correspondiente — ver [Atlas registrados](README.md#atlas-registrados). El mismo monorepo recibe cambios al contenido sectorial y a las piezas compartidas del Sistema: registro, estándar, instaladores y orquestadora nacional.

## Cómo enviar un cambio

Este repositorio usa el flujo estándar de GitHub:

1. Haz un *fork* del repositorio a tu cuenta.
2. Crea una rama descriptiva para tu cambio (`git checkout -b registra-atlas-agro`).
3. Realiza y confirma tus cambios (ver convenciones más abajo).
4. Abre un *Pull Request* hacia la rama `main`, describiendo qué cambiaste y por qué.

Para correcciones menores (un enlace roto, una errata) también puedes abrir un *Issue* describiendo el problema.

## Tipos de contribución

### 1. Registrar un atlas nuevo

Si construiste un atlas compatible con el estándar (ver [Cómo crear un atlas nuevo](README.md#cómo-crear-un-atlas-nuevo)), un solo Pull Request lo registra:

1. Agrega su fila en la tabla de atlas de [`registro.md`](registro.md), declarando la versión de la especificación que cumple.
2. Agrega su tabla de entidades y las fronteras temáticas nuevas que introduce, en el mismo `registro.md`.
3. Agrega su fila en la tabla «Atlas registrados» del `README.md` y su tarjeta en el banner. Si el atlas vive en este monorepo, el logo va en `atlas/<sector>/assets/`; si es externo, permanece en el `assets/` de su propio repositorio.

### 2. Proponer cambios al estándar

`estandar/especificacion.md` es el único documento versionado del Sistema, y los atlas registrados declaran la versión que cumplen — por eso sus cambios piden un paso previo:

1. Abre primero un *Issue* describiendo el cambio y su motivación.
2. Indica qué componente de la versión subiría: parche (redacción, sin alterar lo exigido), menor (adición que no obliga a ajustar atlas) o mayor (cambio que sí los obliga).
3. Acordado el alcance en el *Issue*, abre el Pull Request actualizando la especificación y su número de versión.

### 3. Mejorar la orquestadora nacional o las fronteras temáticas

La skill `atlas-orquestador-colombia` y la sección de fronteras de `registro.md` definen el enrutamiento entre atlas:

1. Respeta el patrón de enrutamiento (N4): el nodo señala qué atlas responde cada tramo; no duplica URLs ni contenido de las skills de los atlas.
2. Toda frontera nueva se declara en `registro.md`; la tabla de la skill es su espejo compacto y debe actualizarse en el mismo cambio.

### 4. Agregar consultas de ejemplo

`examples/consultas-de-ejemplo.md` reúne consultas que cruzan atlas: cada una es un prompt más su ruta esperada, anotada por atlas y entidad, sin URLs (las URLs viven en las skills de los atlas).

## Convenciones

- **Nombres de los atlas:** siempre el título completo (p. ej. «Atlas de Navegación Ambiental de Colombia»); el proyecto no usa siglas para los atlas.
- **Redacción en positivo:** afirmaciones de atribución («operado por X»), sin negaciones ni menciones de fallas salvo que sean información de navegación necesaria.
- **Encoding:** todos los archivos en UTF-8, con tildes, `ñ` y signos de apertura (`¿` `¡`) correctos.

## Proceso de revisión

- Los cambios al registro, la orquestadora y los ejemplos pueden proponerse directamente por Pull Request.
- Los cambios al estándar requieren el *Issue* previo descrito arriba.
- El registro de un atlas nuevo requiere que el atlas esté publicado y cumpla la parte normativa (N1–N5) de la versión del estándar que declara.
