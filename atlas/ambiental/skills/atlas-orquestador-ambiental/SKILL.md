---
name: atlas-orquestador-ambiental
description: "Capa de coordinación del Atlas Ambiental de Colombia: orienta consultas temáticas e interinstitucionales para las 7 skills institucionales."
---

# Atlas Ambiental de Colombia — Skill Orquestadora

Esta skill coordina el uso de las 7 skills institucionales del Atlas según el tema, la entidad principal y las fuentes complementarias relevantes para cada consulta.

## Mapa de skills por subsector

    sector ambiental
    │
    ├─ política y autoridad ambiental
    │   ├─ navegar-minambiente ··· MinAmbiente — política nacional, SIAC, normativa, cambio climático
    │   └─ navegar-anla ·········· ANLA — licenciamiento ambiental, sanciones, seguimiento de proyectos
    │
    ├─ conocimiento hidroclimático y de recursos
    │   └─ navegar-ideam ········· IDEAM — hidrología, meteorología, deforestación, calidad del aire
    │
    ├─ investigación en biodiversidad y áreas protegidas
    │   ├─ navegar-iavh ·········· IAvH — biodiversidad continental, colecciones biológicas, SiB Colombia
    │   ├─ navegar-invemar ······· INVEMAR — ecosistemas marinos y costeros, SIAM
    │   └─ navegar-pnn ··········· PNN — áreas protegidas, RUNAP, SINAP
    │
    └─ gestión del riesgo de desastres
        └─ navegar-ungrd ········· UNGRD — amenazas naturales, geovisores de riesgo, PNGRD, variabilidad climática

## Cómo usar esta skill

Consulta `atlas-orquestador-ambiental` para:

- Identificar qué entidad o entidades cubren un tema ambiental
- Definir el orden de consulta en una ruta interinstitucional
- Resolver qué skill tiene competencia principal cuando el tema involucra varias entidades

Usa la skill institucional directamente cuando la entidad es conocida ("expedientes ANLA", "series DHIME del IDEAM", "RUNAP de PNN").

## Procedimiento

1. **Identificar el tema o necesidad** — ¿qué tipo de información busca la consulta?
2. **Localizar en el mapa de skills** — identificar el subsector y las skills candidatas.
3. **Definir el orden de consulta** — para consultas que cruzan varias entidades, ver `## Rutas sugeridas`; para temas de una sola entidad, invocar directamente.
4. **Invocar las skills en ese orden** — cada skill opera en su dominio; no mezclar competencias.

## Rutas sugeridas

Puntos de entrada para consultas que cruzan varias entidades. El orden es orientativo.

| Consulta | Skills sugeridas | Sistemas clave |
|----------|-----------------|----------------|
| Licenciamiento de un proyecto | ANLA → MinAmbiente → IDEAM | VITAL, GACETA · normativa · estudios ambientales |
| Cambio climático y variabilidad climática | MinAmbiente → IDEAM → UNGRD | SNICC, RENARE, ROE · inventario GEI, proyecciones · seguimiento El Niño/La Niña |
| Deforestación y bosques | IDEAM → IAvH → MinAmbiente | SMByC, RNZD, IFN · BioModelos · SNIF (SIAC) |
| Biodiversidad continental | IAvH → MinAmbiente → PNN | I2D, SiB Colombia · SIB (SIAC) · RUNAP |
| Ecosistemas marino-costeros | INVEMAR → MinAmbiente → PNN | SIAM · SIAC · RUNAP (áreas marinas protegidas) |
| Áreas protegidas | PNN → MinAmbiente → IAvH/INVEMAR | RUNAP, SINAP · SINAP-RUNAP (SIAC) · BioTablero / SIAM |
| Calidad del agua | IDEAM → ANLA → MinAmbiente | DHIME, SIRH · dashboards ANLA · SIAC (SIRH) |
| Calidad del aire | IDEAM → MinAmbiente | SISAIRE · SIAC (SISAIRE), RETC |
| Recursos naturales y sanciones | ANLA → MinAmbiente | RUIA, tablero sancionatorio · normativa sustantiva |
| Amenazas naturales y riesgo de desastres | UNGRD → IDEAM → MinAmbiente | Geovisores UNGRD (volcánico, movimientos en masa, erosión costera), Atlas de Riesgo · DHIME, alertas IDEAM · SIAC |
| Erosión costera y riesgo en zonas marino-costeras | UNGRD → INVEMAR → MinAmbiente | Geovisor de erosión costera UNGRD · SIAM · SIAC |
| Obras de reducción del riesgo y licenciamiento | UNGRD → ANLA → MinAmbiente | Portal BI UNGRD (obras de infraestructura) · VITAL, GACETA · normativa |

## Reglas para combinar resultados sin mezclar competencias

- No atribuir datos de una entidad a otra. Cada skill es autoridad en su propio dominio.
- Cuando dos entidades publican datos sobre el mismo fenómeno, señalar la diferencia de rol:
  - MinAmbiente formula política y coordina el SINA; IDEAM, IAvH, INVEMAR y PNN generan el conocimiento técnico-científico que sustenta esa política.
  - ANLA otorga y vigila licencias ambientales; MinAmbiente define la normativa que ANLA aplica.
  - IAvH investiga biodiversidad continental; INVEMAR investiga ecosistemas marinos y costeros — no se superponen territorialmente.
  - UNGRD coordina el Sistema Nacional de Gestión del Riesgo de Desastres (SNGRD), distinto del SINA que coordina MinAmbiente; UNGRD gestiona la respuesta y reducción del riesgo ante amenazas (muchas de origen natural o climático), mientras IDEAM produce el conocimiento hidrometeorológico que UNGRD usa para monitoreo y alerta temprana.
  - PNN administra las áreas protegidas (gestión); IAvH e INVEMAR producen el conocimiento científico que puede sustentar su declaratoria o manejo.
  - El SIAC (MinAmbiente) es el sistema agregador de datos ambientales de todo el SINA; las entidades técnicas (IDEAM, IAvH, INVEMAR, PNN) son la fuente primaria de esos datos.

## Consultas que cruzan a otros sectores

Para consultas que cruzan a otros sectores, el enrutamiento entre atlas vive en el nodo nacional [Sistema Atlas Colombia](../../../nacional/skills/atlas-orquestador-colombia/SKILL.md).
