# Casos de uso

Hay dos tipos de caso, marcados con el campo `tipo:` en el frontmatter:

- **`navegacion`** — qué entidad y qué ruta responden una consulta. Es un archivo `.md` plano en esta carpeta.
- **`analisis`** — un flujo reproducible sobre datos del sector (descargar, procesar, analizar). Vive en su propia subcarpeta `<slug>/` con un `README.md` y los archivos que produce el caso.

## Cuándo agregar un caso

- Consulta real que combina una o más skills → `navegacion`
- Ruta de búsqueda para documentar y estandarizar → `navegacion`
- Flujo de navegación entre entidades que resolvió un problema concreto → `navegacion`
- Herramienta o metodología desarrollada sobre datos del sector → `analisis`


## Plantilla — tipo `navegacion`

Archivo plano `tema-subtema.md` en esta carpeta.

```markdown
---
tipo: navegacion
entidades: [navegar-minambiente, navegar-anla, ...]
tema: biodiversidad / licenciamiento / clima / áreas protegidas / etc.
---

# [Título descriptivo]

## Consulta
"¿Pregunta o tarea concreta?"

## Entidades y rutas

- **ENTIDAD** — `ruta/dentro/del/sitio`: qué información se encuentra aquí
```


## Plantilla — tipo `analisis`

Subcarpeta `<slug>/` con este `README.md` dentro, junto a los archivos que produce el caso.

```markdown
---
tipo: analisis
entidades: [navegar-ideam, ...]
tema: deforestación / calidad del agua / etc.
fecha: AAAA-MM-DD
---

# [Título descriptivo]

## Consulta
"¿Pregunta o tarea concreta que motivó el análisis?"

## Datos
Fuente oficial exacta, formato y cómo obtenerlos (URL o paso de descarga).
Los datos crudos NO se incluyen en el repositorio; se documenta su origen para que el caso sea reproducible.

## Metodología
Pasos reproducibles y decisiones de procesamiento.

## Herramientas
Stack usado (Python, pandas, QGIS, etc.) y los archivos construidos, con su ubicación dentro de esta carpeta.

## Resultado
Qué se obtuvo (incluidas figuras o reportes) y con qué limitaciones.
```


## Campos de frontmatter

| Campo | Uso | Aplica a |
|-------|-----|----------|
| `tipo` | `navegacion` o `analisis` | ambos |
| `entidades` | Skills involucradas | ambos |
| `tema` | Tema principal del caso | ambos |
| `fecha` | Cuándo se verificó o corrió el caso | ambos (opcional) |


## Convención de nombre

`tema-subtema.md` en minúsculas con guiones, tanto para el archivo `navegacion` como para la subcarpeta `analisis`. Ejemplos:

- `licenciamiento-ambiental.md` (navegacion)
- `calidad-agua-monitoreo/` (analisis)
- `deforestacion-series-smbyc/` (analisis)
