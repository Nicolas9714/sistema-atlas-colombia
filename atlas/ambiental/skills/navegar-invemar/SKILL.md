---
name: navegar-invemar
description: Guía para navegar el sitio oficial de INVEMAR y encontrar información pública de alto valor sobre ecosistemas marinos y costeros de Colombia, incluyendo el SIAM, el Geovisor SIAM, las cuatro operaciones estadísticas (EPPA, ICAM, ICTAC, IECC), el Catálogo HUB ArcGIS y las colecciones del Museo MAKURIWA.
---

# Instituto de Investigaciones Marinas y Costeras José Benito Vives de Andréis (INVEMAR)

INVEMAR es el instituto científico de referencia del Estado colombiano para la investigación y el monitoreo de los ecosistemas marinos y costeros del Caribe y el Pacífico. Está adscrito al Ministerio de Ambiente y Desarrollo Sostenible.

## ¿Qué información publica?

- Sistema de Información Ambiental Marina (SIAM): datos marinos y costeros organizados en cinco áreas temáticas (biodiversidad, calidad ambiental, geociencias, valoración de recursos, gestión costera); incluye SIAM-Explorer y Geovisor SIAM
- Cuatro operaciones estadísticas de acceso abierto en ArcGIS Hub: EPPA (presión pesquera artesanal), ICAM (calidad de aguas marinas y costeras), ICTAC (condición de áreas coralinas), IECC (erosión costera)
- ARGOS: Sistema de Soporte Multitemático para el Monitoreo Ambiental (requiere autenticación)
- RedCAM: red nacional de vigilancia de calidad marina con 12 corporaciones autónomas regionales costeras; reportes anuales desde 2001
- Colecciones biológicas del Museo de Historia Natural Marina de Colombia (MAKURIWA): préstamo, consulta y depósito de material biológico
- Centro de Documentación (CDO): catálogo bibliográfico y tesauro ambiental marino-costero especializados
- Publicaciones científicas: Boletín de Investigaciones Marinas y Costeras (revista arbitrada), informes de monitoreo de Ciénaga Grande de Santa Marta y litoral del Magdalena

## Sitio oficial

`https://www.invemar.org.co/`

## Cómo usar esta skill

1. Consulta `mapa-web.md` para ubicar la sección o subdominio relevante dentro del sitio y los sistemas del SIAM.
2. Consulta `fuentes.md` para acceder directamente al SIAM, las operaciones estadísticas, el Geovisor, el Catálogo HUB o las colecciones del museo.
3. En el repositorio del Atlas, la carpeta `examples/` reúne casos de análisis reproducibles y consultas de ejemplo con su ruta esperada.

## Notas de navegación

- El SIAM (`https://siam.invemar.org.co`) es el portal central de datos; estaba en renovación parcial al momento de la verificación. Conviene navegar desde ahí antes de buscar en el sitio general.
- Las cuatro operaciones estadísticas (EPPA, ICAM, ICTAC, IECC) son portales ArcGIS Hub independientes con datasets descargables; los enlaces directos están en `fuentes.md`.
- `https://centrodocumentacion.invemar.org.co` presentó error SSL el 2026-06-15; acceder al CDO desde la sección de servicios del sitio principal.
- `https://boletin.invemar.org.co/ojs/index.php/boletin` devuelve 404 (2026-06-15); buscar la revista en Redalyc o SciELO como alternativa.
- El SAMP (Subsistema de Áreas Marinas Protegidas) está accesible en `https://siam.invemar.org.co/samp` al 2026-07-04; la ruta anterior `https://cinto.invemar.org.co/samp` devuelve 404.
- El sitio usa Liferay; el crawler genera URLs con prefijo `/web/guest/`. Las URLs sin ese prefijo son las canónicas para navegar manualmente.
