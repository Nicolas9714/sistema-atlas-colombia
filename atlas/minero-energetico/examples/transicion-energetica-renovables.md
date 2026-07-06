---
tipo: navegacion
entidades: [navegar-minenergia, navegar-upme, navegar-anla, navegar-xm]
tema: transición energética / renovables
---

# Medir el avance real de la meta 6GW de renovables

## Consulta

"¿Cuánta capacidad solar y eólica ha entrado en operación frente a la meta 6GW, qué proyectos siguen atascados en licenciamiento y cuánto están generando realmente los que ya operan?"

## Ruta

1. **MinEnergía → Plan 6GW+** (`simec/plan-6gw/`): tomar el monitoreo oficial de proyectos y la capacidad acumulada frente a la meta.
2. **ANLA → Geovisor Público** (`geovisor.anla.gov.co:8446`) y Eureka: revisar qué proyectos FNCER están en evaluación o seguimiento, para distinguir los operativos de los atascados en licenciamiento.
3. **XM → SIMEM** (`simem.co`): descargar la generación horaria por fuente y la capacidad instalada efectiva — el dato de operación real contra el anuncio.
4. **UPME → plan de expansión** (`simec/planeacion-energetica/plan-de-expansion-de-la-generacion/`) y geovisor de potencial (`simec/geovisores/potencial-energetico/`): contrastar el avance con la trayectoria planeada y el potencial disponible.

## Entidades y rutas

- **MinEnergía** — Plan 6GW+ (`simec/plan-6gw/`): monitoreo de proyectos, capacidad acumulada e indicadores. La cifra de la meta.
- **UPME** — geovisor de potencial energético y plan de expansión de la generación: la planeación.
- **ANLA** — Geovisor Público (`geovisor.anla.gov.co:8446`) y Eureka: el estado del licenciamiento ambiental de los proyectos.
- **XM** — SIMEM (`simem.co`): generación horaria por fuente y capacidad instalada. La operación real.
