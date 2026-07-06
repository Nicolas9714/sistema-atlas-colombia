---
tipo: navegacion
entidades: [navegar-upme, navegar-minenergia, navegar-xm, navegar-sgc]
tema: estadísticas / política energética
caso_relacionado: balance-energetico-consumo-final/
---

# Armar la línea base estadística del sector energético

## Consulta

"Necesito la línea base estadística para un informe de política energética: balance energético nacional, producción y consumo por fuente, precios del mercado eléctrico y recursos del subsuelo."

## Ruta

1. **UPME → BECO** (`simec/oferta-y-demanda/balance-energetico-colombiano/`): descargar el Balance Energético Colombiano (libro de Excel); es la foto oficial de oferta, transformación y consumo por energético. El caso relacionado `balance-energetico-consumo-final/` muestra cómo extraer de ahí la serie de consumo final de forma reproducible.
2. **UPME → indicadores** (`indicadores-y-graficos/`): complementar con los tableros Power BI por categoría (demanda, precios, emisiones).
3. **MinEnergía → IntegraME** (`integrame.gov.co`): cruzar con los 23 tableros temáticos del portal integrado de datos del sector.
4. **XM → SIMEM** (`simem.co`): descargar las series históricas de generación, demanda y precios del mercado eléctrico.
5. **SGC → datos abiertos** (`datos.sgc.gov.co`): cerrar con los datasets de recursos del subsuelo por categoría temática, si el informe cubre minería e hidrocarburos.

## Entidades y rutas

- **UPME** — BECO (`simec/oferta-y-demanda/balance-energetico-colombiano/`) e `indicadores-y-graficos/` (tableros Power BI): la estadística oficial de planeación.
- **MinEnergía** — IntegraME (`integrame.gov.co`): portal integrado de datos del sector, 23 tableros temáticos.
- **XM** — SIMEM (`simem.co`): series históricas de generación, demanda y precios.
- **SGC** — `datos.sgc.gov.co`: datasets de recursos del subsuelo por categoría temática.
