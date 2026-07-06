---
tipo: navegacion
entidades: [navegar-ipse, navegar-upme, navegar-minenergia]
tema: zonas no interconectadas / cobertura eléctrica
---

# Diagnóstico de energización de una zona no interconectada

## Consulta

"¿Qué localidades del Chocó están en la ZNI, cuántas horas de servicio reciben hoy y qué proyectos de energización o FNCER están en curso para cerrar la brecha?"

## Ruta

1. **IPSE → Centro Nacional de Monitoreo (CNM)** (`centro-nacional-de-monitoreo-cnm/`): consultar la telemetría de las localidades ZNI del Chocó — horas de prestación, energía generada y estado del servicio en tiempo casi real.
2. **IPSE → SIGIPSE** (`sigipse/`): listar los proyectos de energización en formulación, ejecución u operación para esas localidades, con su fuente (diésel, solar, híbrida).
3. **UPME → cobertura** (`simec/energia-electrica/cobertura/`): contrastar con el índice de cobertura eléctrica y el plan de ampliación (PIEC) para dimensionar la brecha del departamento.
4. **UPME → PERS** (`simec/planeacion-energetica/plan-energetico-rural-sostenible-pers/`): revisar si existe plan energético rural para la región, con proyectos productivos asociados.
5. **MinEnergía → política de cobertura**: cerrar con los programas de electrificación rural y los fondos que financian los proyectos identificados.

## Entidades y rutas

- **IPSE** — SIGIPSE (`sigipse/`) y Centro Nacional de Monitoreo (`centro-nacional-de-monitoreo-cnm/`): proyectos ZNI y estado del servicio en tiempo real. La fuente operativa de la ZNI.
- **UPME** — `simec/energia-electrica/cobertura/` y `simec/planeacion-energetica/plan-energetico-rural-sostenible-pers/`: cobertura, planeación y energización rural.
- **MinEnergía** — política de cobertura y programas de electrificación rural: el marco y la financiación.
