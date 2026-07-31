---
name: navegar-minambiente
description: "Guía de navegación para MinAmbiente: sistemas de información ambiental, normativa, geovisores y portales temáticos de política ambiental colombiana."
---

# Ministerio de Ambiente y Desarrollo Sostenible (MinAmbiente)

El Ministerio de Ambiente y Desarrollo Sostenible es la autoridad ambiental del Estado colombiano. Formula la política nacional ambiental y de recursos naturales renovables; coordina el Sistema Nacional Ambiental (SINA) junto con las Corporaciones Autónomas Regionales, el IDEAM, el ANLA y Parques Nacionales Naturales; y administra el Sistema de Información Ambiental de Colombia (SIAC), que integra 15 subsistemas temáticos sobre biodiversidad, bosques, agua, calidad del aire, cambio climático y residuos.

## ¿Qué tipo de información produce?

- SIAC con 15 subsistemas: biodiversidad (SIB), áreas protegidas (SINAP-RUNAP), bosques (SNIF, SMBYC, IFN), agua (SIRH, DHIME), calidad del aire (SISAIRE), residuos (RESPEL, RUA) y territorios específicos (SIAT-PC, SIAT-AC)
- Sistema Nacional de Información sobre Cambio Climático (SNICC): módulos MRV de mitigación, M&E de adaptación y financiamiento climático
- Registros y reportes de GEI: RENARE (reducción de emisiones, no-causación impuesto al carbono) y ROE (reporte obligatorio de emisiones de organizaciones)
- Geovisores y datos abiertos geoespaciales en el hub ArcGIS del MADS (`siac-datosabiertos-mads.hub.arcgis.com`) con catálogos de mapas y geoservicios descargables
- Normativa ambiental sustantiva: resoluciones, decretos, leyes, CONPES y agenda regulatoria con buscador avanzado
- Portales temáticos propios: economía circular (ENEC), regalías ambientales, negocios verdes, siembra de árboles (Respira 2030)
- Políticas y planes de referencia: NDC 2025, Estrategia E2050, PNACC, PIGCCT, PNGIBSE, Plan Nacional de Negocios Verdes

## Sitio oficial

`https://www.minambiente.gov.co/`

## Cómo usar esta skill

1. Consulta `mapa-web.md` para ubicar la temática relevante dentro del sitio (cambio climático, bosques, agua, aire, normativa, etc.).
2. Consulta `fuentes.md` para acceder directamente a los subsistemas del SIAC, geovisores, portales temáticos y normativa clave.
3. En el repositorio del Atlas, la carpeta `examples/` reúne casos de análisis reproducibles y consultas de ejemplo con su ruta esperada.

## Notas de navegación

- El SIAC (`siac.gov.co`) es la puerta de entrada a los 15 subsistemas ambientales; conviene empezar por ahí antes de navegar el sitio principal del MADS.
- El hub de datos abiertos (`siac-datosabiertos-mads.hub.arcgis.com`) es la ruta más directa para descargar datasets geoespaciales y tabulares del MADS.
- El RENARE y el SNICC operan dentro del portal principal del MADS (sin subdominio propio); sus secciones están bajo `cambio-climatico-y-gestion-del-riesgo/`.
- La normativa ambiental tiene buscador avanzado en `minambiente.gov.co/filtros-normativa/busqueda-avanzada/` (etiquetado como "Portal Antiguo", pero funcional).
