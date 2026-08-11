---
name: navegar-ungrd
description: "Guía de navegación para la UNGRD: sistemas de información sobre amenazas y riesgo de desastres, geovisores de fenómenos naturales, variabilidad climática y normativa de gestión del riesgo."
---

# Unidad Nacional para la Gestión del Riesgo de Desastres (UNGRD)

La UNGRD es la entidad del Estado colombiano que coordina el Sistema Nacional de Gestión del Riesgo de Desastres (SNGRD). Articula el conocimiento, la reducción y el manejo del riesgo asociado a amenazas de origen natural y socionatural — sismos, volcanes, movimientos en masa, inundaciones, erosión costera, variabilidad y cambio climático — con incidencia directa sobre la planificación ambiental y territorial del país.

## ¿Qué información publica?

- Sistemas de información geoespacial sobre amenazas naturales: geovisores de riesgo volcánico, movimientos en masa, erosión costera, eventos NATECH (accidentes tecnológicos desencadenados por fenómenos naturales) y volcanes de lodo
- Atlas de Riesgo nacional (departamental y municipal) con capas de amenaza, vulnerabilidad y pérdidas anuales esperadas
- Datos abiertos filtrables por categoría (Amenaza, Institucional, NATECH, Riesgo)
- Seguimiento al Fenómeno El Niño y a la variabilidad climática, con enfoque territorial y sectorial
- Plan Nacional de Gestión del Riesgo de Desastres (PNGRD) y Marco Estratégico de Gestión Integral del Riesgo (MEGIR), con módulos de formulación, seguimiento y evaluación
- Normativa del Sistema Nacional de Gestión del Riesgo: leyes, decretos, resoluciones, circulares y conceptos jurídicos
- Herramienta de búsqueda de fondos de financiamiento (nacionales, territoriales e internacionales) para proyectos de gestión del riesgo
- Tableros de analítica (Portal BI) sobre proyectos de infraestructura, control presupuestal, distribución territorial de eventos y maquinaria pesada
- Micrositios de proyectos especiales y cooperación científica (SATREPS, MCR2030, Colombia Resiliente)

## Sitio oficial

`https://portal.gestiondelriesgo.gov.co/`

## Cómo usar esta skill

1. Consulta `mapa-web.md` para ubicar la sección relevante dentro del sitio o sus subdominios.
2. Consulta `fuentes.md` para acceder directamente a sistemas, geovisores, portales de datos y documentos clave.
3. En el repositorio del Atlas, la carpeta `examples/` reúne casos de análisis reproducibles y consultas de ejemplo con su ruta esperada.

## Notas de navegación

- El sitio institucional (`https://portal.gestiondelriesgo.gov.co`) es SharePoint 2013 clásico; el Sistema Nacional de Información (`https://sni.gestiondelriesgo.gov.co`) es una SPA moderna y separada que concentra los sistemas técnicos y geoespaciales vigentes — para datos de riesgo, geovisores y financiación, priorizar SNIGRD sobre el portal institucional.
- `https://sni.gestiondelriesgo.gov.co` y `https://snigrd.gestiondelriesgo.gov.co` son subdominios distintos y fácilmente confundibles: el primero es el portal informativo del SNIGRD, el segundo aloja trámites transaccionales (certificados RUD, registro de proveedores) mediante SPA con hash-routing.
- El Geoportal UNGRD vive en un dominio externo sin `.gov.co` (`https://geoportalgestiondelriesgo.com`); no es un error de navegación.
- El Registro Único de Damnificados legado se accede por IP directa sin HTTPS (`201.130.16.28:8080`), enlazado activamente desde el home del portal.
