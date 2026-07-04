---
name: navegar-anla
description: "Guía de navegación para la ANLA: expedientes y trámites de licenciamiento ambiental, geovisores de proyectos licenciados, normativa y jurisprudencia ambiental."
---

# Agencia Nacional de Licencias Ambientales (ANLA)

La ANLA es la entidad del Estado colombiano responsable de garantizar que los proyectos, obras o actividades sujetos a licenciamiento, permiso o trámite ambiental cumplan con la normativa para proteger y renovar los recursos naturales. Otorga, niega y hace seguimiento a licencias ambientales en sectores como hidrocarburos, minería, energía e infraestructura, y ejerce la función sancionatoria ambiental a nivel nacional.

## ¿Qué tipo de información produce?

- Expedientes de licenciamiento ambiental, resoluciones, permisos y autocertificados consultables en VITAL (`vital-publico.minambiente.gov.co`) y GACETA (`gaceta.anla.gov.co:8443`)
- Registro de sanciones y procesos sancionatorios ambientales (RUIA y tablero Power BI) con consulta pública sin autenticación
- Cartografía y datos geoespaciales de proyectos licenciados: geovisor público, AGIL (solo institucional), geovisor de minería ilegal DMI, datos abiertos ArcGIS Hub
- Catálogo de ~30 proyectos en evaluación (por sector) y ~28-30 proyectos en seguimiento (por región operativa SSLA)
- Normativa, jurisprudencia, manuales, guías, conceptos jurídicos y especies en riesgo consolidados en Eureka (8 categorías)
- Cinco tipos de certificaciones ambientales procesadas vía VITAL: emisiones vehículos (CEPD), exclusión IVA (CEI), deducción renta (CADR), soluciones ambientales (CSA), alternativas sostenibles (CASP)
- Dashboards de analítica de datos (Power BI) sobre permisos, emisiones, calidad del agua, biodiversidad, participación ciudadana y seguimiento de proyectos estratégicos
- Informes de gestión anuales (2016-2025) con reporte GRI de sostenibilidad desde 2020, y datos abiertos en datos.gov.co

## Sitio oficial

`https://www.anla.gov.co/`

## Cómo usar esta skill

1. Consulta `mapa-web.md` para ubicar la sección relevante dentro del sitio o sus subdominios.
2. Consulta `fuentes-prioritarias.md` para acceder directamente a sistemas, geovisores, portales de datos y documentos clave.
3. En el repositorio del Atlas, la carpeta `examples/` reúne casos de uso que combinan varias entidades.

## Notas de navegación

- Para consultar el estado de un expediente o trámite ambiental, usar VITAL (`vital-publico.minambiente.gov.co/buscador`); GACETA (`gaceta.anla.gov.co:8443`) permite buscar resoluciones, permisos y autocertificados por tipo de documento y región operativa; la búsqueda en GACETA no reconoce tildes.
- Los subdominios del geovisor (`geovisor.anla.gov.co:8446`), GeoExplora (`geoexploraanla.anla.gov.co:8443`) y GACETA operan en puertos no estándar; Chrome puede mostrar advertencia de certificado SSL al abrirlos (aceptar la excepción). Pueden ser bloqueados por firewalls corporativos; acceder desde red doméstica si ocurre bloqueo.
- Eureka (`anla.gov.co/wanla/eureka`) es una base de conocimiento jurídico-técnico con 8 categorías de documentos que cubre regulación ANLA y del SINA; útil para consultas de normativa, jurisprudencia y conceptos jurídicos ambientales.
- Los proyectos mineros, energéticos y de infraestructura de mayor relevancia nacional tienen micrositios propios accesibles desde `proyectos-de-interes-en-evaluacion` (organizado por sector) y `proyectos-de-interes-en-seguimiento` (organizado por región operativa de la SSLA).
