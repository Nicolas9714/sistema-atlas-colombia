---
name: atlas-orquestador-colombia
description: "Nodo nacional del Sistema Atlas Colombia: enruta consultas que cruzan sectores entre los Atlas de Navegación registrados (minero energético y ambiental)."
---

# Sistema Atlas Colombia — Skill Orquestadora Nacional

Esta skill coordina consultas que cruzan las fronteras entre atlas sectoriales. Opera igual que la orquestadora de cada atlas, pero sus unidades son atlas completos: identifica qué parte de la consulta responde cada atlas y en qué orden.

Requiere tener instalado al menos un atlas; agrega valor cuando hay dos o más. Cada atlas funciona completo por sí solo — esta skill no lo reemplaza, solo enruta hacia él.

## Tabla de atlas

| Atlas | Sector | Entidades | Orquestadora |
| --- | --- | --- | --- |
| Atlas de Navegación Minero Energético de Colombia | Minero energético | 12: MinEnergía, UPME, CREG, ANH, ANM, SGC, XM, Ecopetrol, IPSE, FENOGE, Superservicios, BEC | `atlas-orquestador-minero-energetico` |
| Atlas de Navegación Ambiental de Colombia | Ambiental | 7: MinAmbiente, ANLA, IDEAM, IAvH, INVEMAR, PNN, UNGRD | `atlas-orquestador-ambiental` |

## Fronteras temáticas

Temas cuya respuesta cruza atlas. La entrada indica por dónde empezar; el detalle de cada tramo vive en las skills del atlas correspondiente.

| Frontera | Entrada sugerida | Ruta entre atlas |
| --- | --- | --- |
| Licenciamiento y restricciones ambientales de minería | Atlas de Navegación Minero Energético de Colombia | ANM, SGC (títulos, geología) → Atlas de Navegación Ambiental de Colombia: ANLA, MinAmbiente (regionalización, páramos, áreas protegidas) |
| Obligaciones ambientales e impacto hídrico de hidrocarburos | Atlas de Navegación Ambiental de Colombia | ANLA (licencias y seguimiento) → Atlas de Navegación Minero Energético de Colombia: ANH (tierras, normativa) → Atlas de Navegación Ambiental de Colombia: IDEAM, MinAmbiente (series hidrométricas, recurso hídrico) |
| Licenciamiento ambiental de FNCER | Atlas de Navegación Minero Energético de Colombia | UPME (Plan 6GW+) → Atlas de Navegación Ambiental de Colombia: ANLA (Geovisor Público, Eureka) → Atlas de Navegación Minero Energético de Colombia: XM (generación por fuente) |
| Línea base hidrometeorológica de proyectos energéticos | Atlas de Navegación Minero Energético de Colombia | UPME, ANH (planeación) → Atlas de Navegación Ambiental de Colombia: IDEAM (DHIME, SIRH) |
| Gestión del riesgo en infraestructura minero energética | Atlas de Navegación Ambiental de Colombia | UNGRD (geovisores de amenaza) → Atlas de Navegación Minero Energético de Colombia: ANM, SGC (zonas mineras) → Atlas de Navegación Ambiental de Colombia: IDEAM (alertas) |

## Procedimiento

1. **Identificar el sector dominante de la consulta** — ¿dónde vive la mayor parte de la respuesta?
2. **Entrar por la orquestadora de ese atlas** — resolver ahí todo lo que ese sector cubre.
3. **Detectar la frontera** — si parte de la consulta nombra entidades o temas de otro sector, localizarla en la tabla de fronteras.
4. **Enrutar el tramo restante al otro atlas** — entrar por su orquestadora y continuar con sus skills de entidad.
5. **Combinar sin mezclar competencias** — cada atlas es autoridad en su sector; aplicar las reglas de atribución de cada orquestadora.

## Degradación

Si solo hay un atlas instalado, resolver lo que su alcance permite y señalar en qué atlas vive el resto de la respuesta (tabla de atlas). Es el mismo comportamiento de una skill de entidad ante una consulta multi-entidad: alcance propio + referencia.

## Registro

La lista autorizada de atlas, entidades y fronteras vive en [`registro.md`](https://github.com/Nicolas9714/sistema-atlas-colombia/blob/main/registro.md). Esta tabla es su espejo compacto; ante divergencia, manda el registro.
