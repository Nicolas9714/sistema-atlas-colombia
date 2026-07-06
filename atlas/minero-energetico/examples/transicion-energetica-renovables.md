---
tipo: navegacion
entidades: [navegar-minenergia, navegar-upme, navegar-anla, navegar-xm]
tema: transición energética / renovables
---

# Seguimiento de la transición energética: renovables y metas 6GW+

## Consulta
"¿Cuánta capacidad FNCER está instalada, qué proyectos están en curso y qué licencias ambientales tienen?"

## Entidades y rutas

- **MinEnergía** — `simec/plan-6gw/`: monitoreo de proyectos, capacidad acumulada e indicadores
- **UPME** — `simec/geovisores/potencial-energetico/` y `simec/planeacion-energetica/plan-de-expansion-de-la-generacion/`
- **ANLA** — `geovisor.anla.gov.co:8446` (proyectos en evaluación y seguimiento), Eureka
- **XM** — `SIMEM` (`simem.co`): generación horaria por fuente, capacidad instalada

## Notas

- Orden sugerido: MinEnergía (la meta y el monitoreo del Plan 6GW) → UPME (el potencial y la expansión planeada) → ANLA (las licencias de los proyectos) → XM (la capacidad efectivamente en operación).
- Distinción de roles: MinEnergía fija la meta y monitorea el Plan 6GW+; la UPME evalúa el potencial y planea la expansión de la generación; la ANLA licencia ambientalmente los proyectos FNCER; XM reporta la capacidad instalada y la generación real.
- El geovisor de la ANLA opera en puerto no estándar (`:8446`) y puede mostrar advertencia de certificado; aceptar la excepción para cargarlo.
