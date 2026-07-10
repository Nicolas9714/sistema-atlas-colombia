# Fuentes prioritarias — ANLA

---

## Sistemas de información

| Nombre | URL | Descripción | Verificado |
|---|---|---|---|
| VITAL — Ventanilla Integral de Trámites Ambientales en Línea | `vital-publico.minambiente.gov.co` | Portal público de consulta de expedientes, resoluciones y estado de trámites ambientales; recibe radicaciones de licencias y cambios menores; versión nueva que redirige desde legacy | 2026-06-01 |
| VITAL — Buscador de trámites (legacy) | `vital.minambiente.gov.co/SILPA_UT_PRE/ReporteTramite/ReporteTramiteCP.aspx` | Redirige automáticamente (302) a `vital-publico.minambiente.gov.co/buscador`; la URL legacy sigue activa | 2026-06-01 |
| VITAL — Búsqueda de EIA (legacy) | `vital.minambiente.gov.co/SILPA_UT_PRE/ReporteTramite/ReporteEstadoTramite.aspx?tipoBusqueda=eia` | Consulta específica de estudios de impacto ambiental (EIA) radicados ante la ANLA; puede redirigir al nuevo portal | 2026-06-01 |
| GACETA ANLA — Consulta de expedientes | `gaceta.anla.gov.co:8443/Consultar-gaceta` | Búsqueda simple y avanzada de resoluciones, permisos, contratos y autocertificados; filtro por región operativa; no reconoce tildes; incluye video tutorial e instructivo PDF | 2026-06-01 |
| AGIL — Sistema de Análisis Geográfico de Información en el Licenciamiento | `sig.anla.gov.co/seleccion.aspx` | Plataforma GIS de ANLA para gestión de información georeferenciada; requiere autenticación institucional; no tiene acceso público | 2026-06-01 |
| RUIA — Registro Único de Infractores Ambientales | `vital.minambiente.gov.co/SILPA_UT_PRE/RUIA/ConsultarSancion.aspx?Ubic=ext` | Consulta pública de sanciones ambientales impuestas por la ANLA; accesible sin autenticación | 2026-06-01 |
| SILA — Sistema de Licencias, Permisos y Trámites Ambientales | `anla.gov.co/nosotros` | Sistema interno de administración del ciclo completo de licencias y permisos ambientales (referenciado desde la home) | 2026-06-01 |

---

## Geovisores y mapas

| Nombre | URL | Capas principales | Verificado |
|---|---|---|---|
| Geovisor Público ANLA | `geovisor.anla.gov.co:8446/geovisorpublico/#/visor` | Visor público de información ambiental georreferenciada; capas geográficas agrupadas en Evaluación, Seguimiento, Regionalización y Referencia; incluye proyectos en evaluación, proyectos licenciados, inversión 1%, compensaciones, regiones de seguimiento, hidrología, hidrogeología, reportes regionales y capas de referencia | 2026-06-02 |
| Sistema Minería Ilegal (DMI) | `geo.anla.gov.co/dmi` | Sistema geográfico de monitoreo de minería ilegal; SPA — WebFetch devuelve solo "Dmi"; requiere browser para ver capas de intervención no autorizada | 2026-06-01 |
| GeoExplora ANLA — Visor Escolar | `geoexploraanla.anla.gov.co:8443/geoexploraanla/#/inicio` | Visor pedagógico gamificado; inicia con nombre de usuario y organiza la experiencia en capas/herramientas Plantas, Animales y Líneas, con niveles de desafío para recolectar plantas, ubicar animales por hábitat y trazar rutas | 2026-06-02 |
| Portal Datos Abiertos ANLA (ArcGIS Hub) | `datosabiertos-anla.hub.arcgis.com/` | Repositorio de datasets geoespaciales y ambientales abiertos; categorías principales: proyectos en evaluación, proyectos en seguimiento, documentos, trámites y permisos, compensaciones ambientales, monitoreos, sitios temáticos, manuales y guías, aplicaciones y otros recursos | 2026-06-02 |

---

## Portales de datos

| Nombre | URL | Descripción | Verificado |
|---|---|---|---|
| Datos Abiertos ANLA — ArcGIS Hub | `datosabiertos-anla.hub.arcgis.com/` | Catálogo de datasets abiertos con información geoespacial y ambiental de la ANLA; incluye mapas/servicios de proyectos en evaluación, proyectos en seguimiento, compensaciones, permisos, monitoreos, documentos, manuales, aplicaciones y recursos descargables RES2182, SimplifICA y VALIDA | 2026-06-02 |
| Datos Abiertos ANLA — datos.gov.co | `datos.gov.co/browse?Informaci%C3%B3n-de-la-Entidad_Nombre-de-la-Entidad=Autoridad+Nacional+de+Licencias+Ambientales` | Datasets de la ANLA publicados en el portal nacional de datos abiertos del Estado colombiano | 2026-06-01 |

---

## Capas y datasets geográficos destacados

| Fuente | URL | Capas / recursos | Verificado |
|---|---|---|---|
| Geovisor Público — Evaluación | `geovisor.anla.gov.co:8446/geovisorpublico/#/visor` | `ProyectosANLA_Evaluacion`: Línea Proyecto Evaluación, Área Proyecto Evaluación | 2026-06-02 |
| Geovisor Público — Seguimiento | `geovisor.anla.gov.co:8446/geovisorpublico/#/visor` | `ProyectosANLA_Seguimiento`: Punto Proyecto Licenciado, Línea Proyecto Licenciado, Área Proyecto Licenciado; `Comp_Inv1PC`: Inversiones, Compensaciones; Compensaciones; RegionesSeguimientoANLA; T_15_Hidrología; T_16_Hidrogeología; T_33_Proyecto | 2026-06-02 |
| Geovisor Público — Regionalización | `geovisor.anla.gov.co:8446/geovisorpublico/#/visor` | ObjetivosCalidadRecursoHidrico; Regionalizacion_2025; 36 reportes regionales de alertas y análisis: Alto Magdalena, Alto Magdalena Sur, Alto San Jorge, AMEM, Bahía Buenaventura, Bahía Cartagena, Caquetá, Caribe Guajira, Casanare, Putumayo, Río Bogotá, Sogamoso-Lebrija, Tribugá-Cupica, Valle Medio Magdalena, Zona Minera Cesar, Macizo Colombiano, entre otros | 2026-06-02 |
| Geovisor Público — Referencia | `geovisor.anla.gov.co:8446/geovisorpublico/#/visor` | Áreas Potenciales de Restauración Piloto Macuira, ÁreasPrioritariasConservación, División Político Administrativa, ResultadosONG, UnidadesAnálisisTerritorial | 2026-06-02 |
| ArcGIS Hub — Proyectos ANLA Evaluación | `datosabiertos-anla.hub.arcgis.com/maps/fab4a3ec84de4b1c9549ce63b01a0524` | 2 capas: Línea Proyecto Evaluación, Área Proyecto Evaluación; fuente: `portalsig.anla.gov.co/publico/rest/services/PROYECTOS_ANLA/ProyectosANLA_Evaluacion/FeatureServer` | 2026-06-02 |
| ArcGIS Hub — Proyectos ANLA Seguimiento | `datosabiertos-anla.hub.arcgis.com/maps/4aae776cd1d2401b9565aa2c5576a163` | 3 capas: Punto Proyecto Licenciado, Línea Proyecto Licenciado, Área Proyecto Licenciado; fuente: `portalsig.anla.gov.co/publico/rest/services/PROYECTOS_ANLA/ProyectosANLA_Seguimiento/FeatureServer` | 2026-06-02 |
| ArcGIS Hub — Compensaciones | `datosabiertos-anla.hub.arcgis.com/maps/8db47ec5d0b24728ac0d89dc523b48ef` | 6 capas: Compensaciones Antes 2012 - Donde Como; Compensaciones MACPB 2012 - Donde Como; Compensaciones MACP 2012 - Que Cuanto; Compensaciones MCCB 2018 - Donde Como; Compensaciones MCCB 2018 - Que Cuanto; Comp_EstudioTB; fuente: `portalsig.anla.gov.co/publico/rest/services/COMPENSACIONES/Compensaciones/FeatureServer` | 2026-06-02 |
| ArcGIS Hub — Trámites y permisos | `datosabiertos-anla.hub.arcgis.com/search?tags=permisos` | 14 Feature Services; recursos visibles: gestores SRS, gestores GDP, puntos de recolección y centros de acopio SRS/GDP, cantidades GDP baterías, uso racional de bolsas plásticas, detergentes y jabones industriales, Sello Ambiental Colombiano, cantidades SRS pilas y bombillas | 2026-06-02 |
| ArcGIS Hub — Monitoreos | `datosabiertos-anla.hub.arcgis.com/search?categories=monitoreo` | 3 aplicaciones/mapas: Oferta vs Demanda, Estadísticas y Tendencias, Monitoreo Caudales | 2026-06-02 |
| ArcGIS Hub — Recursos descargables | `datosabiertos-anla.hub.arcgis.com/` | Archivos de actualización del Modelo de Almacenamiento Geográfico RES2182 de 2016; SimplifICA; VALIDA | 2026-06-02 |

---

## Publicaciones periódicas

| Nombre | URL | Frecuencia | Verificado |
|---|---|---|---|
| Informes de Gestión ANLA | `anla.gov.co/oficina-de-planeacion/informes-de-gestion-de-la-anla/vigencias-informes-gestion-anla` | Anual (disponibles 2016-2025); incluye reporte GRI de sostenibilidad desde 2020 | 2026-06-01 |

---

## Documentos de referencia

| Nombre | Tipo | URL | Verificado |
|---|---|---|---|
| Metodología General para la Elaboración y Presentación de Estudios Ambientales (MGEPEA 2018) | Guía técnica | `anla.gov.co/evaluacion-de-licencias-ambientales/en-que-consiste-sela` | 2026-06-01 |
| Estrategia de Evaluación SELA 2020-2030 | Documento estratégico | `anla.gov.co/images/documentos/estrategias/26-02-2021-anla-estrategia-de-evaluacion.pdf` | 2026-06-01 |
| Estrategia Integral de Seguimiento SSLA Visión 2030 | Documento estratégico | `anla.gov.co/images/entidad/ses/26-02-2021-anla-estrategia-de-seguimiento.pdf` | 2026-06-01 |
| APiC Corporinoquia — GDB y SHP | Datos geoespaciales descargables | `anla.gov.co/01_anla/documentos/sipta/inversion_1porciento/` | 2026-06-01 |
| APiC Corpouraba — GDB y SHP | Datos geoespaciales descargables | `anla.gov.co/01_anla/documentos/sipta/inversion_1porciento/` | 2026-06-01 |
| Metodología de cálculo de multas ambientales | PDF técnico | `anla.gov.co/oficina-asesora-juridica/actuaciones-sancionatorias-ambientales` | 2026-06-01 |
| Ley 1333 de 2009 (modificada por Ley 2387 de 2024) | Marco legal | `anla.gov.co/oficina-asesora-juridica/actuaciones-sancionatorias-ambientales` | 2026-06-01 |

---

## Aplicativos

| Nombre | URL | Descripción | Verificado |
|---|---|---|---|
| VALIDA | `anla.gov.co/01_anla/entidad/subdirecciones-y-oficinas/instrumentos-permisos-y-tramites-ambientales/sistema-de-informacion-geografica` | Aplicativo de validación de bases de datos geográficas para anexos cartográficos de ICA | 2026-06-01 |
| SimplifICA | `anla.gov.co/01_anla/entidad/subdirecciones-y-oficinas/instrumentos-permisos-y-tramites-ambientales/sistema-de-informacion-geografica` | Aplicativo de simplificación de información cartográfica para Informes de Cumplimiento Ambiental | 2026-06-01 |
| Eureka!! | `anla.gov.co/wanla/eureka` | Base de conocimiento jurídico-técnico: normativa, jurisprudencia, documentos estratégicos, conceptos jurídicos, manuales, especies en riesgo; búsqueda rápida de documentos ANLA y SINA | 2026-06-01 |
| Tablero Power BI — Actuaciones Sancionatorias | `anla.gov.co/oficina-asesora-juridica/actuaciones-sancionatorias-ambientales` | Tablero de control de casos sancionatorios ambientales; embebido en la página de la Oficina Jurídica | 2026-06-01 |
| Analítica de Datos ANLA | `anla.gov.co/gestion-del-conocimiento-y-la-innovacion/gci-analitica-de-datos` | Tableros de control por área (evaluación, permisos SIPTA, participación SMPCA, seguimiento SLA, administrativa, planeación y jurídica) y temáticos: calidad del aire de proyectos licenciados (Cerrejón, Alto San Jorge), ruido del aeropuerto El Dorado, calidad del agua y monitoreo participativo de ríos, FNCER, compensaciones de biodiversidad y procesos sancionatorios. No existe un tablero general de emisiones de fuentes fijas | 2026-07-10 |

---

## Notas por sección

| Sección | Nota |
|---|---|
| `vital-publico.minambiente.gov.co` | El portal VITAL es operado por Minambiente, no por ANLA directamente. La URL legacy `vital.minambiente.gov.co/SILPA_UT_PRE/ReporteTramite/ReporteTramiteCP.aspx` redirige (302) automáticamente a `vital-publico.minambiente.gov.co/buscador`. Ambas versiones activas al 2026-06-01 |
| `gaceta.anla.gov.co:8443/Consultar-gaceta` | Carga correctamente via WebFetch. Puerto 8443 accesible. La búsqueda no reconoce tildes; usar términos sin acentos. Permite filtrar por región operativa: Medio Magdalena, Caribe, Alto Magdalena–Cauca, Pacífico–Río Cauca, Norte Orinoquía–Catatumbo, Sur Orinoquía–Amazonas. Incluye video tutorial e instructivo PDF |
| `sig.anla.gov.co/seleccion.aspx` | AGIL requiere autenticación institucional (modal "Usuarios Autenticados" / "Validar Usuario"). Sin acceso público. El portal externo de recepción geográfica es `geo.anla.gov.co/portal/#/login` (también requiere cuenta) |
| `geovisor.anla.gov.co:8446` | SPA — carga correctamente desde red doméstica. Con browser se verificaron 4 grupos principales: Evaluación, Seguimiento, Regionalización y Referencia. Chrome puede mostrar advertencia de certificado SSL por puerto no estándar; aceptar la excepción para continuar. Puede ser bloqueado por firewalls corporativos |
| `geo.anla.gov.co/dmi` | SPA — WebFetch devuelve solo "Dmi". Requiere browser para ver contenido del sistema de monitoreo de minería ilegal |
| `geoexploraanla.anla.gov.co:8443` | SPA — WebFetch devuelve solo "Visor". Con browser se verificó como visor escolar gamificado con capas/herramientas Plantas, Animales y Líneas, más niveles de desafío |
| `datosabiertos-anla.hub.arcgis.com` | SPA basada en ArcGIS Hub. Con browser se verificaron categorías, recursos descargables y capas internas de los mapas de proyectos en evaluación, proyectos en seguimiento y compensaciones |
| `proyectos-de-interes-en-seguimiento` | ~28-30 proyectos activos organizados por 6 regiones operativas de la SSLA; sectores: energía, infraestructura, hidrocarburos, minería. Incluye proyecto transversal de polinizadores |
| `proyectos-de-interes-en-evaluacion` | ~30+ proyectos en evaluación organizados por sector (hidrocarburos, minería, energía, infraestructura); formato de tarjetas con imagen y enlace a ficha de proyecto |
| `RUIA` | URL real: `vital.minambiente.gov.co/SILPA_UT_PRE/RUIA/ConsultarSancion.aspx?Ubic=ext` — consulta pública sin autenticación de sanciones por NIT o nombre del infractor |
| `wanla/eureka/` | URL activa: `anla.gov.co/wanla/eureka`. La URL `/eureka/` directa devuelve 404. Eureka!! es una base de conocimiento jurídico-técnico con 8 categorías de documentos; no es plataforma de innovación |
| Certificaciones VITAL | Cinco tipos procesados vía VITAL: CEPD (emisiones vehículos), CEI (exclusión IVA), CADR (deducción renta), CSA (soluciones ambientales), CASP (alternativas sostenibles plástico reciclado) |
| Tablero sancionatorios | Power BI ID: `r=eyJrIjoiNTliZDg3ZmQtM2VkZC00MTIzLTk0ZTctM2I0YzkzNDM1ODI1IiwidCI6IjZmMWNjYjk0LWFkYTUtNDM3Zi04NzZkLTQ5NzkyMGNjYmUxOCIsImMiOjR9` — accesible desde `oficina-asesora-juridica/actuaciones-sancionatorias-ambientales` |
