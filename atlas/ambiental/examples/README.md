# Casos de uso

Un caso de uso es un **flujo de análisis reproducible** sobre datos del sector: una consulta real que se resolvió navegando las fuentes oficiales y procesando sus datos. Cada caso vive en su propia subcarpeta `<slug>/` con un `README.md` y los archivos que produce.

La navegación no es un tipo de caso aparte: cada análisis documenta en su README **cómo se llegó a los datos** — la ruta de navegación entre entidades es parte del caso, no un artefacto separado.

Además de los casos, [`consultas-de-ejemplo.md`](consultas-de-ejemplo.md) reúne consultas de demostración: prompts que puedes hacerle al agente con las skills instaladas, con la ruta que debería responderte.

## Cuándo agregar un caso

- Herramienta o metodología desarrollada sobre datos del sector → caso nuevo
- Consulta que se resolvió con datos descargados y procesados de fuentes oficiales → caso nuevo
- Ruta de navegación útil pero sin componente de datos → agregar como consulta a `consultas-de-ejemplo.md`

## Plantilla

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

## Cómo se llegó a los datos
Ruta de navegación que condujo a la fuente: entidad → sistema → sección.

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

| Campo | Uso |
|-------|-----|
| `tipo` | `analisis` |
| `entidades` | Skills involucradas |
| `tema` | Tema principal del caso |
| `fecha` | Cuándo se corrió o verificó el caso |

## Convención de nombre

Subcarpeta `tema-subtema/` en minúsculas con guiones. Ejemplos:

- `calidad-agua-monitoreo/`
- `deforestacion-series-smbyc/`
