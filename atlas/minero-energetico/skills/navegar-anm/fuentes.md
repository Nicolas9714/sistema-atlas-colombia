# Fuentes — ANM

---

## Sistemas de información

| Nombre | URL | Descripción | Verificado |
|---|---|---|---|
| AnnA Minería (SIGM) | `annamineria.anm.gov.co/sigm/externalLogin` | Sistema de Información de Gestión Minera; gestión de contratos de concesión, solicitudes, obligaciones de producción y regalías; requiere registro de usuario | 2026-05-30 |
| Génesis | `tramites.anm.gov.co/Portal/pages/inicio.jsf` | Plataforma anterior de trámites mineros; mantiene consulta pública de títulos y solicitudes históricas | 2026-05-30 |

---

## Geovisores y mapas

| Nombre | URL | Capas principales | Verificado |
|---|---|---|---|
| Visor geográfico público SIGMExt | `annamineria.anm.gov.co/Html5Viewer/index.html?viewer=SIGMExt&locale=es-CO&appAcronym=sigm` | Geocortex Viewer for HTML5; acceso público sin login; capas: títulos mineros, solicitudes, áreas excluibles | 2026-06-16 |
| Visor geográfico AnnA Minería (SIGM) | Integrado en `annamineria.anm.gov.co/sigm/` | Cuadrícula Minera, estado de celdas (libre / titulada / en proceso), áreas de reserva especial, zonas excluidas; requiere registro | 2026-05-30 |
| Cuadrícula Minera descargable | `anm.gov.co/anna-mineria` | Descarga en GeoJSON y GDB (Geodatabase); niveles: Zona UTM, Sector, Sección, Bloque, Conjunto, Grupo, Celda | 2026-05-30 |
| Gestor de metadatos ANM | `anm.gov.co/informacion-geografica` | Modelo de Datos Geográficos ANM v2; metadatos de capas geoespaciales institucionales | 2026-05-30 |

---

## Portales de datos abiertos

| Nombre | URL | Descripción | Verificado |
|---|---|---|---|
| Selección de datos abiertos ANM | `anm.gov.co/seleccion-de-datos-abiertos` | Datasets institucionales: producción trimestral de minerales y contraprestaciones, RUCOM plantas de beneficio certificadas, contratos suscritos, plan de adquisiciones | 2026-05-30 |
| Información del sector y estadísticas | `anm.gov.co/informacion-del-sector-y-estadisticas` | Catálogo paginado (36 páginas) de informes, boletines y estadísticas del sector minero | 2026-05-30 |
| Indicadores socioeconómicos (Power BI) | `anm.gov.co/indicadores-socioeconomicos` | Tablero Power BI con 12 páginas: IED, PIB minero, empleo, exportaciones mineras y precios internacionales de minerales; boletín mensual "Minería en cifras" (ANM + UPME) | 2026-06-16 |

---

## Publicaciones periódicas

| Nombre | Frecuencia | URL o ruta en el sitio | Verificado |
|---|---|---|---|
| Producción Nacional de Minerales y Contraprestaciones Económicas | Trimestral | `seleccion-de-datos-abiertos` (dataset) | 2026-05-30 |
| Informe de gestión ANM | Anual | `planeacion-presupuesto-e-informes` → informe-de-gestion | 2026-05-30 |
| Informe enviado al Congreso | Anual | `planeacion-presupuesto-e-informes` → informe-enviado-al-congreso | 2026-05-30 |

---

## Documentos de referencia

| Nombre | Tipo | URL o ruta | Verificado |
|---|---|---|---|
| Normograma de la ANM | Marco normativo consolidado | `normograma-de-la-agencia-nacional-de-mineria` | 2026-05-30 |
| Código de Minas (Ley 685 de 2001) | Ley | `leyes` | 2026-05-30 |
| Resolución 504 de 2018 | Reglamento de Cuadrícula Minera | `anm.gov.co/504-del-18-de-septiembre-2018` | 2026-05-30 |
| Modelo de Datos Geográficos ANM v2 | Estándar geoespacial | Descarga GDB desde `informacion-geografica` | 2026-05-30 |
| Inventario de trámites mineros | Catálogo de trámites | `inventario-de-tramites-mineros` | 2026-05-30 |

---

## Notas por sección

| Sección | Nota |
|---|---|
| `mineria-en-colombia/` | Micrositio con contexto sectorial e indicadores del sector; incluye rondas mineras, cadenas productivas, tablero de indicadores socioeconómicos (Power BI 12 páginas) y sección de actualidad; mapa de sitio propio en `anm.gov.co/mapa-sitio-mineria-en-colombia` |
| `colombia-ejemplo-de-transformacion-minera-mapa-geovisor/` | Página institucional de acceso al geovisor público SIGMExt; embebe el Geocortex Viewer vía iframe; incluye instrucciones de uso y contacto de soporte (`contactenosANNA@anm.gov.co`) |
| `visor-geografico-publico/` en annamineria | Geocortex Viewer for HTML5 (SIGMExt); acceso público sin registro; tecnología distinta al visor dentro del SIGM; URL real en `notas-internas.md` |
| `annamineria.anm.gov.co` | Reemplaza a Génesis como plataforma principal; requiere registro con correo electrónico; nombre oficial del sistema: SIGM (Sistema de Información de Gestión Minera) |
| `tramites.anm.gov.co` | Plataforma Génesis, acceso legacy; mantiene consulta pública de títulos y solicitudes anteriores a la migración a AnnA |
| `visor-geografico` en AnnA | Herramienta dentro del SIGM para visualizar y seleccionar celdas de la Cuadrícula Minera; permite liberación de áreas y consulta de estado; guía: "Manejo de herramientas visor geográfico 3.0" |
| `seleccion-de-datos-abiertos` | Datasets enlazados a datos.gov.co; incluye RUCOM plantas de beneficio certificadas (registro de comercializadores de minerales) |
| `informacion-del-sector-y-estadisticas` | 36 páginas de contenido; incluye boletines estadísticos, informes de producción y documentos de promoción de la inversión minera |
| `vicepresidencia-contratacion-y-titulacion-minera` | Responsable del catastro minero, titulación, registro minero y contratos de concesión |
| `vicepresidencia-de-seguimiento-control-y-seguridad-minera` | Fiscalización de obligaciones de los títulos; seguridad y salvamento minero |
| `vicepresidencia-de-promocion-y-fomento` | Formalización minera, asistencia técnica (VETA), promoción de la inversión; gestiona el programa de mineros de subsistencia |
| `grupo-seguridad-y-salvamento-minero` | URL de atención de emergencias mineras; línea de emergencias 24/7 |
