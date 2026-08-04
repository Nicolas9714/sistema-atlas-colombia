---
name: atlas-orquestador-colombia
description: "Nodo nacional del Sistema Atlas Colombia: enruta consultas que cruzan sectores entre los Atlas de Navegación registrados (minero energético y ambiental)."
---

# Sistema Atlas Colombia — Skill Orquestadora Nacional

Esta skill coordina consultas que cruzan entre atlas sectoriales. Opera igual que la orquestadora de cada atlas, pero sus unidades son atlas completos: identifica qué parte de la consulta responde cada atlas y en qué orden.

Requiere tener instalado al menos un atlas; agrega valor cuando hay dos o más. Cada atlas funciona completo por sí solo — esta skill no lo reemplaza, solo enruta hacia él.

## Tabla de atlas

| Atlas | Sector | Entidades | Orquestadora |
| --- | --- | --- | --- |
| Atlas de Navegación Minero Energético de Colombia | Minero energético | 12: MinEnergía, UPME, CREG, ANH, ANM, SGC, XM, Ecopetrol, IPSE, FENOGE, Superservicios, BEC | `atlas-orquestador-minero-energetico` |
| Atlas de Navegación Ambiental de Colombia | Ambiental | 7: MinAmbiente, ANLA, IDEAM, IAvH, INVEMAR, PNN, UNGRD | `atlas-orquestador-ambiental` |

## Cruces entre atlas

Las consultas del Sistema suelen ser multisectoriales. Un territorio, un proyecto o un recurso reúne a la vez títulos, licencias, mediciones e infraestructura, y esas competencias están repartidas entre sectores: la respuesta completa se arma con entidades de más de un atlas.

El nodo nacional opera sobre esa expectativa. Ante una consulta concreta, presume el cruce y lo verifica contra la tabla de atlas.

Indicios de cruce:

- La consulta sitúa el asunto en un lugar o en un proyecto determinado.
- Pide el estado de algo junto con su marco regulatorio.
- Combina datos de operación con datos de control o seguimiento.
- Nombra una entidad de un sector y un objeto de competencia de otro.

La lista orienta el juicio y admite casos nuevos. [`examples/consultas-de-ejemplo.md`](../../../../examples/consultas-de-ejemplo.md) reúne consultas resueltas con su ruta esperada: calibran el criterio y muestran cómo se ve un cruce bien enrutado.

## Procedimiento

1. **Identificar el sector dominante de la consulta** — ¿dónde vive la mayor parte de la respuesta?
2. **Entrar por la orquestadora de ese atlas** — resolver ahí todo lo que ese sector cubre.
3. **Detectar el cruce** — comprobar si la consulta pide algo que el sector de entrada no cubre; si es así, identificar el atlas competente en la tabla de atlas.
4. **Enrutar el tramo restante al otro atlas** — entrar por su orquestadora y continuar con sus skills de entidad.
5. **Combinar sin mezclar competencias** — cada atlas es autoridad en su sector; aplicar las reglas de atribución de cada orquestadora.

## Degradación

Si solo hay un atlas instalado, resuelve lo que su alcance permite y señala en qué atlas vive el resto de la respuesta (tabla de atlas). Es el mismo comportamiento de una skill de entidad ante una consulta multi-entidad: alcance propio + referencia.

## Registro

La lista autorizada de atlas y entidades vive en [`registro.md`](../../../../registro.md). La tabla de atlas de arriba es su espejo compacto; ante divergencia, manda el registro.
