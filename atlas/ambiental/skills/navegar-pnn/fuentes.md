# Fuentes — Parques Nacionales Naturales de Colombia (PNN)

---

## Sistemas de información

| Nombre | URL | Descripción | Verificado |
|---|---|---|---|
| RUNAP — Registro Único Nacional de Áreas Protegidas | https://runap.parquesnacionales.gov.co/ | Registro oficial de todas las áreas protegidas de Colombia: nacionales, regionales y locales. Incluye cifras consolidadas, visor geográfico con shapefile descargable, y reportes. Total: 1.882 áreas, 50,2 millones de hectáreas (geográficas). | 2026-06-15 |
| SINAP — Sistema Nacional de Áreas Protegidas | https://www.parquesnacionales.gov.co/sistema-nacional-de-areas-protegidas/ | Página institucional vigente con definición, categorías, representatividad, plan de acción y subsistemas regionales del SINAP. | 2026-07-23 |
| Certificador SINAP | https://cert.parquesnacionales.gov.co/auth | Herramienta de certificación de áreas protegidas para el SINAP. Requiere autenticación; manuales disponibles públicamente. | 2026-06-15 |

---

## Geovisores y mapas

| Nombre | URL | Capas principales | Verificado |
|---|---|---|---|
| Geovisor Áreas Protegidas (ArcGIS) | https://mapas.parquesnacionales.gov.co/ | Mapa interactivo de las 61 áreas del SPNN. Redirige a ArcGIS Online; requiere JavaScript. | 2026-06-15 |
| GeoNetwork — Catálogo de Metadatos Espaciales | https://geonetwork.parquesnacionales.gov.co/ | Catálogo de datos espaciales y metadatos de áreas protegidas. 198 recursos: 182 conjuntos de datos, 10 servicios OGC:WFS, 1 servicio HTML. Accesible con navegador; HTTP 403 solo a crawlers automáticos. | 2026-06-15 |

---

## Portales de datos

| Nombre | URL | Descripción | Verificado |
|---|---|---|---|
| Herencia Colombia | https://www.parquesnacionales.gov.co/herencia-colombia/ | Programa de financiamiento para la permanencia del SINAP: 42 millones de hectáreas, 5 mosaicos regionales, alianzas con Moore Foundation, WWF, CI, WCS y Bezos Earth Fund. | 2026-06-15 |
| SIRAP Orinoquía | https://www.parquesnacionales.gov.co/home/sirap-orinoquia/ | Subsistema Regional de Áreas Protegidas de la Orinoquía, con documentos y mapas del subsistema. | 2026-06-15 |

---

## Estadísticas

| Nombre | URL | Frecuencia | Verificado |
|---|---|---|---|
| Estadísticas de visitantes (2010–2025) | https://www.parquesnacionales.gov.co/ecoturismo/#estadisticas_visitantes | Series anuales descargables en Excel/PDF. Ancla en la página de Ecoturismo. | 2026-06-15 |
| Encuestas de satisfacción de visitantes | https://www.parquesnacionales.gov.co/ecoturismo/#encuestas | Reportes anuales y semestrales 2022–2025. | 2026-06-15 |
| Estadísticas RUNAP — áreas protegidas | https://runap.parquesnacionales.gov.co/ | Cifras oficiales de extensión, número de áreas y cobertura nacional. Fuente citada con corte a junio 2025. | 2026-06-15 |

---

## Publicaciones

| Nombre | URL | Frecuencia | Verificado |
|---|---|---|---|
| Planes de manejo por área protegida | https://www.parquesnacionales.gov.co/entidad/planes-de-manejo-areas-del-spnn/ | PDFs por área, organizados en 6 territoriales. 57 áreas documentadas, publicaciones 2004–2022. | 2026-06-15 |
| Publicaciones de ecoturismo | https://www.parquesnacionales.gov.co/ecoturismo/#publicaciones | Materiales educativos y de divulgación del programa de ecoturismo. | 2026-06-15 |

---

## Normativa

| Nombre | Tipo | URL | Verificado |
|---|---|---|---|
| Normograma PNN | Normograma consolidado | https://www.parquesnacionales.gov.co/normativas/ | 2026-06-15 |
| Resoluciones (2021–2025) | Resoluciones | https://www.parquesnacionales.gov.co/normativas/ | 2026-06-15 |
| Decretos (1974–2024) | Decretos | https://www.parquesnacionales.gov.co/normativas/ | 2026-06-15 |

---

## Notas por sección

| Sección | Nota |
|---|---|
| `https://runap.parquesnacionales.gov.co` | SPA JavaScript. Estructura verificada con browser: raíz (inicio + estadísticas), `/cifras` (tabla por ámbito/categoría: 1.882 áreas, 50,2 M ha geográficas; gráfico por departamento; shapefile descargable), menú `Reportes` abre submenú con `Reportes actuales` → `https://runapadmin.parquesnacionales.gov.co/reportes` y `Reportes históricos` → Google Sites externo. Actualización shapefile: 12/06/2026. |
| SINAP | El antiguo dominio `https://sinap.parquesnacionales.gov.co` está inactivo. La fuente institucional vigente es `https://parquesnacionales.gov.co/sistema-nacional-de-areas-protegidas/`; RUNAP conserva el registro y las cifras oficiales. |
| `https://mapas.parquesnacionales.gov.co` | Redirige permanentemente (301) a `https://pnnc.maps.arcgis.com/apps/webappviewer/index.html?id=2fb3250f7f494b209a300c3fb027211e`. Visor ArcGIS Web AppBuilder con 2 capas: Registro Único de Áreas Protegidas - RUNAP (activa por defecto) y Límites Parques Nacionales. Herramientas: filtro por área protegida, medición, selección, impresión, descarga de capas, recursos adicionales, galería de mapas base. |
| `https://geonetwork.parquesnacionales.gov.co` | Accesible con browser (HTTP 403 solo a crawlers). URL real: `https://geonetwork.parquesnacionales.gov.co/geonetwork/srv/spa/catalog.search#/home`. 198 recursos totales: 182 conjuntos de datos, 11 servicios (10 OGC:WFS, 1 W3C:HTML). Temas INSPIRE: Límites (21), Cobertura tierra/imágenes (4), Medio ambiente (2). Motor: GeoNetwork 3.10.5. |
| `cooperacion/` | Sección funcional con 8 anclas de contenido: resolución, datos de contacto, qué es la cooperación, oferta y demanda, ejes de trabajo, asuntos internacionales, webinar, galería. Tipos de cooperación: técnica, cultural, triangular, sur-sur, donaciones en especie. No es sección institucional estándar; contiene información sobre convenios activos y ejes de trabajo. |
| `herencia-colombia/` | Programa de financiamiento para la permanencia (PFP). Página raíz + 3 subsecciones con URL propia: `/proyectos/` (3 proyectos: KfW HeCo, Paisajes Sostenibles, GCF HeCo), `/documentos-de-interes/` (documentos estratégicos, informes anuales 2023-2025, boletines mensuales, infografías). 5 mosaicos de conservación: Orinoquía, Caribe, Andes Centrales, Corazón Amazonía, Pacífico Marino Costero. |
| `ecoturismo/#estadisticas_visitantes` | Las estadísticas de visitantes son anclas en la página de Ecoturismo, no URLs independientes. El archivo histórico antes de 2022 puede estar en `https://old.parquesnacionales.gov.co/portal/es/ecoturismo/`. |
| `https://cert.parquesnacionales.gov.co` | Herramienta administrativa para certificaciones SINAP. Acceso público solo a noticias y manuales de usuario (enlazados a Google Sites). |
| `https://ue.parquesnacionales.gov.co` | Portal de cooperación con la Unión Europea. Devuelve HTTP 403. Sin acceso verificado. |
| `entidad/planes-de-manejo-areas-del-spnn/` | 57 áreas con planes de manejo en PDF, organizadas en 6 territoriales: Pacífico (10), Caribe (15), Andes Occidentales (9), Andes Nororientales (7), Orinoquía (7), Amazonia (9). |
