---
name: atlas-orquestador-colombia
description: "Nodo nacional del Sistema Atlas Colombia: enruta consultas que cruzan sectores entre los Atlas de Navegación registrados (ANMEC y ANAC)."
---

# Sistema Atlas Colombia — Skill Orquestadora Nacional

Esta skill coordina consultas que cruzan las fronteras entre atlas sectoriales. Opera igual que la orquestadora de cada atlas, pero sus unidades son atlas completos: identifica qué parte de la consulta responde cada atlas y en qué orden.

Requiere tener instalado al menos un atlas; agrega valor cuando hay dos o más. Cada atlas funciona completo por sí solo — esta skill no lo reemplaza, solo enruta hacia él.

## Tabla de atlas

| Atlas | Sigla | Sector | Entidades | Orquestadora |
| --- | --- | --- | --- | --- |
| Atlas de Navegación Minero Energético de Colombia | ANMEC | Minero energético | 12: MinEnergía, UPME, CREG, ANH, ANM, SGC, XM, Ecopetrol, IPSE, FENOGE, Superservicios, BEC | `atlas-orquestador` (ANMEC) |
| Atlas de Navegación Ambiental de Colombia | ANAC | Ambiental | 7: MinAmbiente, ANLA, IDEAM, IAvH, INVEMAR, PNN, UNGRD | `atlas-orquestador` (ANAC) |

## Fronteras temáticas

Temas cuya respuesta cruza atlas. La entrada indica por dónde empezar; el detalle de cada tramo vive en las skills del atlas correspondiente.

| Frontera | Entrada sugerida | Ruta entre atlas |
| --- | --- | --- |
| Licenciamiento y restricciones ambientales de minería | ANMEC | ANM, SGC (títulos, geología) → ANAC: ANLA, MinAmbiente (regionalización, páramos, áreas protegidas) |
| Obligaciones ambientales e impacto hídrico de hidrocarburos | ANAC | ANLA (licencias y seguimiento) → ANMEC: ANH (tierras, normativa) → ANAC: IDEAM, MinAmbiente (series hidrométricas, recurso hídrico) |
| Licenciamiento ambiental de FNCER | ANMEC | UPME (Plan 6GW+) → ANAC: ANLA (Geovisor Público, Eureka) → ANMEC: XM (generación por fuente) |
| Línea base hidrometeorológica de proyectos energéticos | ANMEC | UPME, ANH (planeación) → ANAC: IDEAM (DHIME, SIRH) |
| Gestión del riesgo en infraestructura minero energética | ANAC | UNGRD (geovisores de amenaza) → ANMEC: ANM, SGC (zonas mineras) → ANAC: IDEAM (alertas) |

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
