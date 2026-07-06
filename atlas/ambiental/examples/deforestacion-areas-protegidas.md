---
tipo: navegacion
entidades: [navegar-ideam, navegar-pnn, navegar-iavh, navegar-minambiente]
tema: deforestación / áreas protegidas
---

# Medir la deforestación dentro y alrededor de un área protegida

## Consulta

"¿Cuánta deforestación registró el PNN Serranía de Chiribiquete y su zona aledaña en el último año con cifras oficiales, y qué biodiversidad está bajo presión?"

## Ruta

1. **IDEAM → SMByC**: descargar las cifras anuales oficiales de deforestación y las alertas tempranas (RNZD) de la región amazónica; las capas se obtienen por departamento (Caquetá y Guaviare para este caso).
2. **PNN → RUNAP** (`runap.parquesnacionales.gov.co`): descargar el límite oficial del área protegida y su plan de manejo; el geovisor del SINAP (`mapas.parquesnacionales.gov.co`) permite la vista rápida.
3. **Cruce**: superponer las capas del SMByC con el límite RUNAP (QGIS o similar) para separar la pérdida dentro del parque de la de su zona aledaña.
4. **IAvH → BioModelos y BioTablero**: consultar distribución de especies e indicadores de estado de la biodiversidad en el polígono afectado, para leer qué está bajo presión.
5. **MinAmbiente → Visión Amazonía** (`visionamazonia.minambiente.gov.co`) y SNIF en el SIAC: contexto de la política de reducción de deforestación y agregación de los datos del SINA.

## Entidades y rutas

- **IDEAM** — Sistema de Monitoreo de Bosques y Carbono (SMByC): cifras oficiales de deforestación, alertas tempranas (RNZD) e Inventario Forestal Nacional. Fuente primaria del dato.
- **PNN** — RUNAP y geovisor del SINAP: registro oficial de todas las áreas protegidas (nacionales, regionales y locales), límites y planes de manejo. Fuente del qué y el dónde de las áreas protegidas.
- **IAvH** — BioModelos (`biomodelos.humboldt.org.co`) y BioTablero (`biotablero.humboldt.org.co`): distribución de especies e indicadores de estado de la biodiversidad.
- **MinAmbiente** — Visión Amazonía, SNIF y subsistema SINAP-RUNAP del SIAC, con las políticas PNGIBSE y Herencia Colombia: marco de política y financiación de la conservación.
