# Fuentes — CREG

---

## Sistemas de información

| Nombre | URL | Descripción | Verificado |
|---|---|---|---|
| Gestor Normativo Alejandría | `gestornormativo.creg.gov.co/gestor/index.html` | Buscador de normativa regulatoria consolidada; resoluciones originales, compiladas, proyectos y circulares | 2026-05-30 |
| SCIR | `scir.creg.gov.co/login` | Sistema de Cargue de Información para Regulación; requiere login de empresa regulada | 2026-05-30 |
| SICT | `apps.creg.gov.co` | Sistema Integrado de Cargos de Transporte de Gas Natural; acceso sin login | 2026-05-30 |

---

## Normativa

| Nombre | Tipo | URL | Verificado |
|---|---|---|---|
| Resoluciones CREG | Resoluciones vigentes | `creg.gov.co/loader.php?lServicio=Documentos&lFuncion=infoCategoriaConsumo&tipo=RE` | 2026-05-30 |
| Proyectos de Resoluciones | Consulta pública | `creg.gov.co/loader.php?lServicio=Documentos&lFuncion=infoCategoriaConsumo&tipo=PR` | 2026-05-30 |
| Circulares CREG | Circulares externas | `creg.gov.co/loader.php?lServicio=Documentos&lFuncion=infoCategoriaConsumo&tipo=CI` | 2026-05-30 |
| Autos CREG | Actuaciones administrativas | `creg.gov.co/loader.php?lServicio=Documentos&lFuncion=infoCategoriaConsumo&tipo=AU` | 2026-05-30 |
| Código de Medida (Res. 038/2014) | Reglamento técnico | `creg.gov.co/13334` | 2026-05-30 |

---

## Marco regulatorio por sector

| Nombre | URL | Descripción | Verificado |
|---|---|---|---|
| Energía Eléctrica | `creg.gov.co/15004` | Marco regulatorio del sector eléctrico: generación, transmisión, distribución y comercialización | 2026-05-30 |
| Gas Natural | `creg.gov.co/15005` | Marco regulatorio del gas natural: transporte, distribución y comercialización | 2026-05-30 |
| Gas Licuado del Petróleo | `creg.gov.co/15006` | Regulación del GLP en cilindros y distribución domiciliaria | 2026-05-30 |
| Combustibles Líquidos | `creg.gov.co/15007` | Regulación de precios y distribución de combustibles líquidos | 2026-05-30 |

---

## Temas regulatorios específicos

| Nombre | URL | Descripción | Verificado |
|---|---|---|---|
| Autogeneración a pequeña escala | `creg.gov.co/15064` | Regulación de autogeneración a pequeña escala y generación distribuida | 2026-05-30 |
| Gestor del Mercado de Gas Natural | `creg.gov.co/15075` | Información sobre el operador del mercado mayorista de gas | 2026-05-30 |

---

## Publicaciones

| Nombre | URL | Descripción | Verificado |
|---|---|---|---|
| Histórico de Presentaciones | `creg.gov.co/15392` | Archivo de presentaciones en eventos y sesiones de la CREG | 2026-05-30 |

---

## Servicios y trámites

| Nombre | URL | Descripción | Verificado |
|---|---|---|---|
| Trámites y Servicios | `creg.gov.co/8591` | Trámites y otros procedimientos administrativos ante la CREG | 2026-05-30 |

---

## Notas por sección

| Sección | Nota |
|---|---|
| URL scheme de CREG | El sitio usa el patrón `/publicaciones/ID/slug/` para todas sus páginas (e.g., `/publicaciones/15004/energia-electrica/`); los IDs cortos como `/15004` redirigen a la URL completa; el árbol del mapa usa slugs semánticos |
| `loader.php?tipo=RE` | Las resoluciones individuales usan `&idDirectorio=XXXXXX`; el listado sin ID muestra las más recientes; para búsqueda histórica usar el Gestor Normativo |
| `gestornormativo.creg.gov.co` | Sistema "Alejandría 2.0"; fuente canónica para resoluciones originales, proyectos, circulares y compilaciones consolidadas; subdominio separado del sitio principal |
| `gestornormativo/compilaciones-unicas` | Versiones compiladas (vigentes) de las resoluciones por subsector; 7 categorías: energía eléctrica, gas natural, GLP, combustibles líquidos, código de redes, cargo por confiabilidad, derechos y deberes de usuarios; más útil que el texto original para consulta de marcos regulatorios actuales |
| `gestornormativo/resoluciones-originales` | 8 vistas de acceso: cronológica, no derogadas, derogadas, contribución especial, generales por servicio, generales por servicio y actividad, particulares cronológico, particulares por empresa |
| `gestornormativo/circulares` | 3 vistas: por orden cronológico, por servicio, por servicio y actividad |
| `gestornormativo/compilacion-juridica` | Incluye normas de múltiples entidades (no solo CREG): Ministerios, Superintendencias, DNP, Banco de la República; organizada por tipo de documento (constitución, leyes, decretos, actos administrativos, jurisprudencia); fuente para contexto normativo sectorial más allá de la regulación CREG |
| `gestornormativo/novedades-regulatorias` | Novedad regulatoria desde 2019-11-30; filtrable por tipo de acto (autos, circulares, proyectos, resoluciones) y por servicio (electricidad, gas natural, GLP, combustibles, aspectos generales) |
| `gestornormativo/respuestas-automaticas` | Módulo de IA con carga de archivos; devuelve respuestas informativas sobre regulación; permite descargar PDF; no constituye concepto jurídico vinculante |
| `gestornormativo/indices-tematicos-circulares-por-servicio` | Índice por tipo de servicio (eléctrico, gas, GLP, combustibles); facilita búsqueda temática de circulares |
| `scir.creg.gov.co` | SCIR: plataforma de cargue para empresas reguladas; requiere credenciales; JS-rendered (WebFetch no extrae estructura); ocasionalmente fuera de servicio por mantenimiento |
| `apps.creg.gov.co` | SICT — Sistema Integrado de Cargos de Transporte de Gas Natural; acceso público sin login (solo lectura); construido sobre PowerApps (Microsoft); sin sub-navegación pública |
| `energia-electrica/autogeneracion-a-pequena-escala-y-generacion-distribuida` | URL real: `/publicaciones/15064/autogeneracion-a-pequena-escala-y-generacion-distribuida/`; marco regulatorio clave para prosumidores y generación distribuida |
| `energia-electrica/medicion-avanzada-ami` | URL real: `/publicaciones/15067/medicion-avanzada-ami/`; regulación de infraestructura de medición avanzada |
| `gas-natural/gas-natural-cargos-maximos` | URL real: `/publicaciones/13145/gas-natural-cargos-maximos/`; tarifas y cargos máximos del transporte de gas natural |
