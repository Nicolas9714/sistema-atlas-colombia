---
name: atlas-orquestador-minero-energetico
description: "Capa de coordinación del Atlas de Navegación Minero Energético de Colombia: orienta consultas temáticas e interinstitucionales para las 12 skills institucionales."
---

# Atlas de Navegación Minero Energético de Colombia — Skill Orquestadora

Esta skill coordina el uso de las 12 skills institucionales del Atlas según el tema, la entidad principal y las fuentes complementarias relevantes para cada consulta.

## Mapa de skills por subsector

    sector minero-energético
    │
    ├─ transversal
    │   ├─ navegar-minenergia ···· MinEnergía — política, normativa, IDE-ME, transición energética
    │   ├─ navegar-upme ·········· UPME — planeación, estadísticas, geovisores, CIO sectorial
    │   ├─ navegar-creg ·········· CREG — regulación tarifaria (electricidad, gas, GLP, combustibles)
    │   └─ navegar-superservicios · Superservicios — SUI, tarifas vigentes, monitoreo, cobertura
    │
    ├─ eléctrico
    │   ├─ navegar-xm ············ XM — mercado mayorista, operación SIN, API datos
    │   ├─ navegar-ipse ·········· IPSE — zonas no interconectadas, electrificación rural
    │   └─ navegar-fenoge ········ FENOGE — convocatorias FNCER, comunidades, PTEP
    │
    ├─ hidrocarburos y gas
    │   ├─ navegar-anh ··········· ANH — E&P, Mapa de Tierras, producción, reservas
    │   ├─ navegar-bec ··········· BEC — mercado gas, precios, subastas, iGas-D
    │   └─ navegar-ecopetrol ····· Ecopetrol — informes, sostenibilidad, precios combustibles
    │
    └─ minería y subsuelo
        ├─ navegar-anm ··········· ANM — catastro, títulos, producción, formalización
        └─ navegar-sgc ··········· SGC — geología, amenazas sísmicas, cartografía

## Cómo usar esta skill

Consulta `atlas-orquestador-minero-energetico` para:

- Identificar qué entidad o entidades cubren un tema sectorial
- Definir el orden de consulta en una ruta interinstitucional
- Resolver qué skill tiene competencia principal cuando el tema involucra varias entidades

Usa la skill institucional directamente cuando la entidad es conocida ("resoluciones CREG", "producción ANH", "geovisor ANM").

## Procedimiento

1. **Identificar el tema o necesidad** — ¿qué tipo de información busca la consulta?
2. **Localizar en el mapa de skills** — identificar el subsector y las skills candidatas.
3. **Definir el orden de consulta** — para consultas que cruzan varias entidades, ver `## Rutas sugeridas`; para temas de una sola entidad, invocar directamente.
4. **Invocar las skills en ese orden** — cada skill opera en su dominio; no mezclar competencias.

## Rutas sugeridas

Puntos de entrada para consultas que cruzan varias entidades. El orden es orientativo.

| Consulta | Skills sugeridas | Sistemas clave |
|----------|-----------------|----------------|
| Expansión eléctrica | UPME → XM → CREG | PET, PERS, Plan 6GW+ · IPOEMP · transmisión |
| Tarifas eléctricas | CREG → Superservicios → XM | Alejandría · SUI · bolsa/confiabilidad |
| Hidrocarburos | ANH → Ecopetrol → MinEnergía | Mapa de Tierras · informes · SGR |
| Minería formal | ANM → SGC → UPME | AnnA Minería · MIIG · SIMCO |
| ZNI | IPSE → FENOGE → UPME → CREG | SIGIPSE, CNM · PTEP · PERS · reg. ZNI |
| Transición energética | MinEnergía → UPME → FENOGE → XM | TEJ · Plan 6GW+ · EN-Comunidad · generación |
| Gas natural | BEC → CREG → ANH | SEGAS, iGas-D · Alejandría · upstream |

## Reglas para combinar resultados sin mezclar competencias

- No atribuir datos de una entidad a otra. Cada skill es autoridad en su propio dominio.
- Cuando dos entidades publican datos sobre el mismo fenómeno, señalar la diferencia de rol:
  - BEC publica datos del mercado transaccional de gas; CREG publica la regulación y metodologías tarifarias.
  - XM publica precios de bolsa y operación del SIN; CREG regula los cargos y el diseño del mercado.
  - UPME publica estadísticas sectoriales agregadas; XM publica datos operativos en tiempo real.

## Consultas que cruzan a otros sectores

Para consultas que cruzan a otros sectores, el enrutamiento entre atlas vive en el nodo nacional [Sistema Atlas Colombia](https://github.com/Nicolas9714/sistema-atlas-colombia/blob/main/atlas/nacional/skills/atlas-orquestador-colombia/SKILL.md).

