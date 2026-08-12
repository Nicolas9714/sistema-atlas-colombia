# Fuentes — XM

---

## Sistemas de información

| Nombre | URL | Descripción | Verificado |
|---|---|---|---|
| API pública XM (SiNERGOX) | `https://servapibi.xm.com.co/lists` | REST API pública sin autenticación; método POST; endpoints `/hourly`, `/daily`, `/monthly`, `/lists`; cubre Hidrología, Demanda, Oferta y Generación, Transacciones y Precios, Intercambios Internacionales, Emisiones CO2 | 2026-08-11 |
| Portal SiNERGOX | `sinergox.xm.com.co/Paginas/Home.aspx` | Portal público de información del MEM y operación del SIN (SharePoint); mayoría de secciones de libre acceso; login requerido solo para funciones administrativas; 7 secciones temáticas + herramientas | 2026-06-05 |
| SIMEM | `https://www.simem.co` | Sistema de Información del Mercado Eléctrico Mayorista; portal de datos abiertos operado por UPME y XM; API propia en `www.simem.co/backend-files/api/PublicData?datasetid={ID}` | 2026-08-11 |
| FTP Redespacho | `ftp://sv01.xm.com.co/Redespacho/` | Datos de redespacho diario y horario en formato plano; acceso público | 2026-05-30 |
| NEXOS | `nexos.xm.com.co` | Plataforma de aprendizaje y formación para agentes del mercado | 2026-05-30 |
| IDO — Portal de Operaciones | `ido.xm.com.co/Views/Ido/ido` | Portal de información diaria de operación; enlazado desde SiNERGOX | 2026-06-05 |
| IDO — Eventos | `ido.xm.com.co/Views/Ido/eventos` | Registro de eventos operativos del SIN; enlazado desde SiNERGOX | 2026-06-05 |
| PARATEC | `paratec.xm.com.co` | Portal de parámetros técnicos del SIN; enlazado desde SiNERGOX | 2026-06-05 |
| SICEP MEM | `sicep.xm.com.co` | Sistema Centralizado de Información Pública de la Contratación del MEM; estadísticas de contratos del mercado regulado y no regulado | 2026-06-05 |

---

## Publicaciones periódicas

| Nombre | Frecuencia | URL o ruta en el sitio | Verificado |
|---|---|---|---|
| Boletín energético | Bimestral | `nuestra-empresa/informes/informes-de-la-operacion-y-el-mercado/boletin-energetico` | 2026-05-30 |
| Informe operación del SIN y administración del mercado | Anual | `nuestra-empresa/informes/informes-de-la-operacion-y-el-mercado/informe-operacion-del-sin-y-administracion-del-mercado` | 2026-05-30 |
| Informes mensuales de análisis de mercado | Mensual | `nuestra-empresa/informes/informes-de-la-operacion-y-el-mercado/informes-mensuales-de-analisis-del-mercado` | 2026-05-30 |
| Situación energética actual | Periódico | `nuestra-empresa/informes/informes-de-la-operacion-y-el-mercado/situacion-energetica-actual` | 2026-05-30 |
| Informe IPOELP (largo plazo) | Anual | `planeación/planeación-largo-plazo/informe-de-planeamiento-operativo-electrico-de-largo-plazo` | 2026-05-30 |
| Informe IPOEMP (mediano plazo) | Semestral | `operación/planeación/planeación-mediano-plazo/informe-de-planeamiento-operativo-electrico-del-mediano-plazo` | 2026-05-30 |
| Análisis trimestral de restricciones | Trimestral | `planeación/planeación-largo-plazo/analisis-trimestral-de-restricciones` | 2026-05-30 |

---

## Documentos de referencia

| Nombre | Tipo | URL o ruta | Verificado |
|---|---|---|---|
| MPODE — Base de datos largo plazo | Base de datos descargable | `planeación/planeación-largo-plazo/analisis-energetico-de-largo-plazo-mpode-base-de-datos` | 2026-05-30 |
| Base de datos IPOEL (Digsilent) | Base de datos eléctrica | `planeación/planeación-largo-plazo/base-de-datos-digsilent/base-de-datos-ipoel-digsilent` | 2026-05-30 |
| AEMP — Base de datos mediano plazo | Base de datos descargable | `planeación/planeación-mediano-plazo/analisis-energetico-de-mediano-plazo-base-de-datos` | 2026-05-30 |
| Mapa de Ruta para la Transición Energética 2030 | Informe estratégico | `nuestra-empresa/informes/informes-corporativos/mapa-de-ruta-para-la-transicion-energetica-2030` | 2026-05-30 |
| Estándar de información del redespacho 2023 | Documento técnico | PDF en `sites/default/files/inline-files/XM-CND-Estandar de informacion del redespacho_2023.pdf` | 2026-05-30 |
| Estándar de información del despacho 2025 | Documento técnico | PDF en `sites/default/files/documents/XM-CND-2025-060-Estandar-de-informacion-del-despacho-2025.pdf` | 2026-05-30 |

---

## Herramientas de la API

| Nombre | Tipo | Acceso | Verificado |
|---|---|---|---|
| `pydataxm` | Librería Python | `pip install pydataxm`; soporta SiNERGOX y SIMEM | 2026-05-30 |
| Consulta_API_SINERGOX_XM.xlsm | Macro Excel (no-code) | Repositorio GitHub `EquipoAnaliticaXM/API_XM` | 2026-05-30 |
| Consulta_API_SIMEM.xlsm | Macro Excel (no-code) | Repositorio GitHub `EquipoAnaliticaXM/API_XM` | 2026-05-30 |
| Repositorio GitHub API_XM | Documentación completa de la API | `github.com/EquipoAnaliticaXM/API_XM` | 2026-05-30 |

---

## Notas por sección

| Sección | Nota |
|---|---|
| `servapibi.xm.com.co` | API pública sin usuario ni clave. Método POST. Endpoints: `/hourly` y `/daily` (máx 30 días por llamado), `/monthly` (máx 731 días), `/lists` (catálogo de métricas). Body: `{"MetricId": "...", "StartDate": "YYYY-MM-DD", "EndDate": "YYYY-MM-DD", "Entity": "...", "Filter": [...]}`. Catálogo completo: `POST /lists` con `{"MetricId": "ListadoMetricas"}` |
| `sinergox.xm.com.co` | Portal público SharePoint del MEM. Acceso libre a la mayoría de secciones; login requerido solo para funciones administrativas (`/_layouts/15/Authenticate.aspx`). 7 secciones temáticas: Demandas y Fronteras, Hidrología, Oferta y Generación, Transacciones y Precios, Intercambios Internacionales, Restricciones e Informes. WAF bloquea IPs en modo headless — navegar con `--headed`. No confundir con la API pública `servapibi.xm.com.co`. Portales externos enlazados: `ido.xm.com.co` (IDO + Eventos), `paratec.xm.com.co`, `sicep.xm.com.co`, `github.com/EquipoAnaliticaXM/API_XM` |
| `www.simem.co` | Portal de datos abiertos del sector; API: `GET www.simem.co/backend-files/api/PublicData?datasetid={ID}`. Restricciones: horaria/diaria máx 31 días, semanal/mensual máx 731 días, anual máx 1827 días |
| `hidrología/` | Datos en tiempo real de embalses, reservas y aportes; alta relevancia durante episodios de sequía o emergencias energéticas |
| `operación/planeación/` vs `planeación/` | Hay duplicidad de URLs: resultados de estudios están en `operación/planeación/`; bases de datos descargables en `planeación/` |
| `transacciones/cargo-por-confiabilidad/` | El cargo por confiabilidad es el mecanismo central de remuneración de capacidad firme; los nodos de obligaciones están organizados por vigencia (año de entrega) |
| `administración-financiera/garantías/simulador-calculadora` | Herramienta web para calcular el monto de garantía requerido para operar en bolsa de energía |
| `ftp://sv01.xm.com.co/Redespacho/` | FTP público; `/Redespacho/` para diario, `/Redespacho/Horario/` para horario |
| `formación/trabajos-de-investigacion-xm` | Investigaciones y tesis patrocinadas por XM; acceso público; valor analítico alto |
