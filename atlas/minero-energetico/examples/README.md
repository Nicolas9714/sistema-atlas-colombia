# Casos de uso

Se proponen dos tipos de casos:

- **`navegacion`** — qué entidad y qué ruta responden una consulta. Es un archivo `.md` plano en esta carpeta.
- **`analisis`** — un flujo reproducible sobre datos del sector (descargar, procesar, analizar). Vive en su propia subcarpeta `<slug>/` con un `README.md` y los archivos que produce el caso.

 Estos casos son marcados con el campo `tipo:` en el frontmatter.

## Cuándo agregar un caso

- Consulta real que combina una o más skills → `navegacion`
- Ruta de búsqueda para documentar y estandarizar → `navegacion`
- Flujo de navegación entre entidades que resolvió un problema concreto → `navegacion`
- Herramienta o metodología desarrollada sobre datos del sector → `analisis`

Un caso de `navegacion` puede corresponder con un caso de `analisis` y operar como una unidad: la navegación documenta dónde y cómo encontrar los datos, y el análisis los procesa. El campo `caso_relacionado` del frontmatter enlaza los dos, de forma recíproca.

## Plantilla — tipo `navegacion`

Archivo plano `tema-subtema.md` en esta carpeta.

```markdown
---
tipo: navegacion
entidades: [navegar-upme, navegar-creg, ...]
tema: mercado de gas / minería / regulación / etc.
caso_relacionado: <slug-del-analisis>/   # opcional, si opera como unidad con un caso de analisis
---

# [Título descriptivo]

## Consulta
"Una sola pregunta específica y contestable: lugar + objeto + qué se espera obtener."

## Ruta

1. Paso concreto en orden real de resolución (entidad → sistema → acción: descargar, filtrar, cruzar...)
2. ...

## Entidades y rutas

- **ENTIDAD** — `ruta/dentro/del/sitio`: qué aporta (referencia compacta)
```


## Plantilla — tipo `analisis`

Subcarpeta `<slug>/` con este `README.md` dentro, junto a los archivos que produce el caso.

```markdown
---
tipo: analisis
entidades: [navegar-xm, ...]
tema: precios de energía / producción de gas / etc.
fecha: AAAA-MM-DD
caso_relacionado: <tema-subtema>.md   # opcional, si opera como unidad con un caso de navegacion
---

# [Título descriptivo]

## Consulta
"¿Pregunta o tarea concreta que motivó el análisis?"

## Datos
Fuente oficial exacta, formato y cómo obtenerlos (URL, API o paso de descarga).
Los datos crudos NO se incluyen en el repositorio; se documenta su origen para que el caso sea reproducible.

## Metodología
Pasos reproducibles y decisiones de procesamiento.

## Herramientas
Stack usado (Python, pandas, Power BI, etc.) y los archivos construidos, con su ubicación dentro de esta carpeta.

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
| `caso_relacionado` | Caso pareja con el que opera como unidad (recíproco) | ambos (opcional) |


## Convención de nombre

`tema-subtema.md` en minúsculas con guiones, tanto para el archivo `navegacion` como para la subcarpeta `analisis`. Ejemplos:

- `mercado-gas-natural.md` (navegacion)
- `series-precio-bolsa-xm/` (analisis)
- `balance-energetico-analisis/` (analisis)
