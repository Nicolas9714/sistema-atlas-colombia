---
name: navegar-ideam
description: "Guía de navegación para el IDEAM: datos hidrometeorológicos, monitoreo de bosques y deforestación, calidad del aire, pronósticos y atlas climáticos."
---

# Instituto de Hidrología, Meteorología y Estudios Ambientales (IDEAM)

El IDEAM es un establecimiento público adscrito al Ministerio de Ambiente y Desarrollo Sostenible. Su función principal es generar el conocimiento, la información y los datos del estado de los recursos naturales del país —agua, aire, suelo, ecosistemas y clima— que sirven de base para la gestión ambiental, el ordenamiento territorial y la toma de decisiones públicas y privadas. Opera la red nacional de estaciones hidrometeorológicas y es la autoridad técnica en hidrología, meteorología y estudios ambientales de Colombia.

## ¿Qué tipo de información produce?

- Datos hidrometeorológicos: series de tiempo de caudales, niveles, precipitación y temperatura de la red nacional de estaciones, descargables desde el DHIME
- Pronósticos y alertas: boletines meteorológicos diarios, alertas hidrológicas (FEWS), imágenes de satélite GOES y radar en tiempo casi real
- Información forestal y de deforestación: monitoreo anual de bosques y carbono (SMByC), Inventario Forestal Nacional (IFN), SNIF y Registro Nacional de Zonas Deforestadas (RNZD)
- Registros ambientales: RUA (uso de recursos naturales por sectores), RETC (emisiones y transferencia de contaminantes), inventarios de PCB y generadores de residuos peligrosos (RESPEL)
- Calidad del aire: monitoreo continuo por estaciones en SISAIRE, informes anuales y datos de PM2.5, PM10, ruido y emisiones por fuentes fijas y móviles
- Estudios de cambio climático: inventario nacional de GEI, proyecciones climáticas, vulnerabilidad y adaptación, NDC y contabilidad de carbono
- Atlas y documentos de referencia: Atlas Climatológico, Atlas de Radiación Solar y Atlas del Viento de Colombia; normales climatológicas históricas

## Sitio oficial

`https://www.ideam.gov.co/`

## Cómo usar esta skill

1. Consulta `mapa-web.md` para ubicar la sección relevante dentro del sitio: pronósticos, hidrología, ecosistemas, estudios ambientales o geoportal.
2. Consulta `fuentes-prioritarias.md` para acceder directamente a sistemas (DHIME, SIRH, SISAIRE, SMByC, FEWS), geovisores, portales de datos y publicaciones periódicas.
3. En el repositorio del Atlas, la carpeta `examples/` reúne casos de uso que combinan varias entidades.

## Notas de navegación

- El DHIME (`dhime.ideam.gov.co/atencionciudadano/`) es la puerta de entrada para descargar series históricas de estaciones hidrometeorológicas; el acceso interno a la plataforma AQUARIUS requiere credenciales institucionales.
- Los geovisores del IDEAM están alojados en el subdominio `visualizador.ideam.gov.co` (ArcGIS Online); el punto de entrada es el Geoportal Ambiental Institucional en `ideam.gov.co/geoportal-ambiental-institucional`.
- SISAIRE (`sisaire.ideam.gov.co`) y FEWS (`fews.ideam.gov.co`) son subdominios propios; presentaron errores de certificado SSL durante la verificación — usar el Geoportal como acceso alternativo si el acceso directo falla.
- El SMByC publica el informe anual de deforestación; los datos abiertos de bosques se descargan desde la sección de datos abiertos del sitio principal.
