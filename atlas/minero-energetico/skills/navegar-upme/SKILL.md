---
name: navegar-upme
description: "Guía de navegación para la UPME: planeación energética y minera, estadísticas sectoriales, geovisores y convocatorias de expansión."
---

# Unidad de Planeación Minero-Energética (UPME)

La UPME es una Unidad Administrativa Especial adscrita al Ministerio de Minas y Energía. Su función principal es planear en forma integral, indicativa y coordinada el desarrollo y aprovechamiento de los recursos energéticos y mineros de Colombia, y ejerce como CIO (Chief Information Officer) del sector minero-energético colombiano.

## ¿Qué tipo de información produce?

- Sistema de Información Minero Energético Colombiano (SIMEC): estadísticas de energía eléctrica, hidrocarburos, minería (SIMCO), eficiencia energética, oferta y demanda, y planeación energética (PEN, PERS, PET, PROURE, proyecciones)
- Plan 6GW+: monitoreo de proyectos FNCER, indicadores energéticos y geovisores del plan de expansión de renovables
- Geovisores sectoriales en cuatro categorías: Distritos Mineros, Potencial Energético (solar, OBCO, FNCER), Energía Eléctrica (capacidad, generación, transmisión) y Territorial
- Convocatorias de expansión: transmisión (STN), gas y subastas de largo plazo para renovables
- Tableros Power BI con series históricas de indicadores minero-energéticos
- CIO sectorial: políticas, metodología y lineamientos de gobernanza de datos para todas las entidades del sector
- Biblioteca digital con repositorio de estudios y publicaciones; Argo GPL para seguimiento al abastecimiento de GLP

## Sitio oficial

`https://www.upme.gov.co/`

## Cómo usar esta skill

1. Consulta `mapa-web.md` para ubicar el subsistema SIMEC, geovisor o sección relevante.
2. Consulta `fuentes-prioritarias.md` para acceder directamente al SIMEC, geovisores, convocatorias, CIO sectorial o Biblioteca Digital.
3. En el repositorio del Atlas, la carpeta `examples/` reúne casos de análisis reproducibles y consultas de ejemplo con su ruta esperada.

## Notas de navegación

- El SIMEC es el portal central de la UPME; casi toda la información sectorial está organizada bajo `simec/`. Conviene navegar desde ahí antes de buscar en el sitio general.
- Los geovisores, la Biblioteca Digital y el sistema Argo GPL operan en subdominios propios; los enlaces directos están en `fuentes-prioritarias.md`.
- El SIMEM (`simem.co`) es un portal de datos conjunto entre UPME y XM; se documenta en la skill `navegar-xm`.
- La UPME ejerce como CIO del sector minero-energético colombiano: los lineamientos de gobernanza de datos que publica aplican a todas las entidades del sector, no solo a la UPME.
