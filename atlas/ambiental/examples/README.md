# Ejemplos y casos de uso

## Cuándo agregar un ejemplo

- Consulta real que combina dos o más skills
- Ruta de búsqueda para documentar y estandarizar
- Flujo de navegación entre entidades que resolvió un problema concreto
- Herramienta o metodología desarrollada sobre datos del sector


## Plantilla mínima

```markdown
---
entidades: [navegar-minambiente, navegar-anla, ...]
tema: biodiversidad / licenciamiento / clima / áreas protegidas / etc.
---

# [Título descriptivo]

## Consulta
"¿Pregunta o tarea concreta?"

## Entidades y rutas

- **ENTIDAD** — `ruta/dentro/del/sitio`: qué información se encuentra aquí

## Notas
(opcional — accesos, restricciones, tips de navegación, contexto)
```

## Campos opcionales

| Campo | Uso |
|-------|-----|
| `fecha` | Cuándo se verificó el caso |
| `nivel` | simple / intermedio / avanzado |
| `resultado` | Qué se obtuvo al final |
| `pendiente` | Algo que faltó resolver |
| `herramientas` | Scripts, librerías, plataformas usadas (Python, Power BI, etc.) |
| `datos` | Datasets descargados o consultados, formato, fuente exacta |
| `metodologia` | Enfoque de análisis, flujo de procesamiento, pasos reproducibles |
| `artefactos` | Archivos generados: scripts, notebooks, visualizaciones, reportes |

## Convención de nombre de archivo

`tema-subtema.md` en minúsculas con guiones. Ejemplos:
- `licenciamiento-ambiental-proyectos.md`
- `monitoreo-calidad-agua.md`
- `biodiversidad-especies-amenazadas.md`
