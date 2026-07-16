# Guía de contribución

Gracias por querer mejorar este atlas. Aquí se explica cómo proponer cambios.

## Cómo enviar un cambio

Este repositorio usa el flujo estándar de GitHub:

1. Haz un *fork* del repositorio a tu cuenta.
2. Crea una rama descriptiva para tu cambio (`git checkout -b actualiza-fuentes-creg`).
3. Realiza y confirma tus cambios (ver convenciones más abajo).
4. Abre un *Pull Request* hacia la rama `main`, describiendo qué cambiaste y por qué.

Para correcciones menores (un enlace roto, una errata) también puedes abrir un *Issue* describiendo el problema.

## Tipos de contribución

### 1. Mejorar una skill existente

Si encontraste un enlace desactualizado, una fuente nueva o un ejemplo aplicado útil:

1. Ubica la carpeta correspondiente en `skills/<entidad>/`.
2. Edita el archivo relevante (`mapa-web.md`, `fuentes-prioritarias.md` o `SKILL.md`).
3. Si tu aporte es un caso de análisis reproducible o una consulta de demostración, va en `examples/` siguiendo las convenciones de `examples/README.md`.
4. Describe el cambio en el mensaje de commit: qué se actualizó y por qué.

### 2. Agregar una nueva entidad

Si una entidad del sector minero-energético no está cubierta:

1. Crea `skills/navegar-<nueva-entidad>/` con los tres archivos base — `SKILL.md`, `mapa-web.md` y `fuentes-prioritarias.md` — usando como punto de partida las plantillas del [Sistema Atlas Colombia](https://github.com/Nicolas9714/sistema-atlas-colombia/tree/main/estandar/templates). La estructura de tres archivos y el nombre `navegar-*` son parte de la [especificación](https://github.com/Nicolas9714/sistema-atlas-colombia/blob/main/estandar/especificacion.md) que este atlas cumple.
2. Completa el `SKILL.md` con el front matter (`name`, `description`) y la descripción de la entidad.
3. Verifica que las fuentes citadas estén activas y accesibles, y registra la fecha de verificación (ver convenciones).
4. Agrega la entidad a la tabla de "Entidades cubiertas" del `README.md`.

## Convenciones

- **Fecha de verificación:** en `mapa-web.md`, la última línea es `Verificado: AAAA-MM-DD` (solo la fecha, sin sufijos). En `fuentes-prioritarias.md`, las tablas incluyen una columna de fecha por fuente. Actualiza la fecha cuando revalides el contenido.
- **Árbol de `mapa-web.md`:** texto plano; una ruta con `/` es una URL navegable y sin `/` es una sección interna (pestaña, acordeón o contenido JavaScript). Sin flechas, emojis ni comentarios inline.
- **Redacción en positivo:** afirmaciones de atribución («operado por X»), sin negaciones ni menciones de fallas salvo que sean información de navegación necesaria.
- **Encoding:** todos los archivos en UTF-8, con tildes, `ñ` y signos de apertura (`¿` `¡`) correctos.

## Proceso de revisión

- Los cambios a skills existentes pueden proponerse directamente por Pull Request.
- Las skills nuevas requieren al menos una verificación de que las fuentes están activas y accesibles al momento de la contribución.
