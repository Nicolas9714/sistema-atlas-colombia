---
name: navegar-pnn
description: "Guía de navegación para Parques Nacionales Naturales de Colombia (PNN): RUNAP, sistemas de información del SINAP, geovisor de áreas protegidas, planes de manejo, estadísticas de visitantes y normativa ambiental."
---

# Parques Nacionales Naturales de Colombia (PNN)

PNN es la entidad adscrita al Ministerio de Ambiente y Desarrollo Sostenible encargada de administrar el Sistema de Parques Nacionales Naturales (SPNN) y de coordinar el Sistema Nacional de Áreas Protegidas (SINAP). Gestiona 61 áreas protegidas que cubren 23.208.921 hectáreas (10,07 % del territorio nacional) y 38.865.081 hectáreas incluyendo los Distritos Nacionales de Manejo Integrado.

## ¿Qué tipo de información produce?

- **RUNAP** (Registro Único Nacional de Áreas Protegidas): registro oficial de todas las áreas protegidas del país — nacionales, regionales y locales
- **SINAP**: portal del sistema nacional con subsistemas regionales (SIRAP), marco normativo y análisis de representatividad ecológica
- Geovisor de áreas protegidas (ArcGIS, accesible vía `mapas.parquesnacionales.gov.co`)
- Catálogo de metadatos espaciales (GeoNetwork)
- Planes de manejo en PDF por área protegida (57 áreas documentadas, organizadas por territorial)
- Estadísticas de visitantes (series anuales 2010–2025) y encuestas de satisfacción
- Normograma ambiental: leyes, decretos, circulares y resoluciones (1959–2025)
- Documentos del programa Herencia Colombia (financiamiento para la permanencia del SINAP)

## Sitio oficial

`https://www.parquesnacionales.gov.co/`

## Cómo usar esta skill

1. Consulta `mapa-web.md` para ubicar la sección relevante dentro del sitio y sus subdominios.
2. Consulta `fuentes-prioritarias.md` para acceder directamente al RUNAP, GeoNetwork, geovisor, estadísticas de visitantes y planes de manejo.
3. En el repositorio del Atlas, la carpeta `examples/` reúne casos de uso que combinan varias entidades.

## Notas de navegación

- El **RUNAP** (`runap.parquesnacionales.gov.co`) es el sistema de referencia para consultar el registro oficial de áreas protegidas; el visor embebido no renderiza por JavaScript, pero la URL raíz es accesible.
- El **SINAP** (`sinap.parquesnacionales.gov.co`) no resuelve por DNS al 2026-07-04 (dominio inexistente); el registro de áreas protegidas se consulta por el RUNAP.
- El **geovisor principal** (`mapas.parquesnacionales.gov.co`) redirige a ArcGIS Online — requiere navegador con JavaScript para cargar las capas.
- **GeoNetwork** (`geonetwork.parquesnacionales.gov.co`) devuelve HTTP 403 — acceso bloqueado para crawlers; navegar directamente desde el navegador.
- El portal EU (`ue.parquesnacionales.gov.co`) también devuelve HTTP 403.
- El **Certificador SINAP** (`cert.parquesnacionales.gov.co`) requiere autenticación; solo disponible información pública mínima.
- Las estadísticas de visitantes están en `ecoturismo/#estadisticas_visitantes` (ancla en la misma página, no URL independiente).
