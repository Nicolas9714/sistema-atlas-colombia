---
name: navegar-bec
description: "Guía de navegación para BEC: información transaccional y operativa del mercado de gas natural colombiano, informes y estadísticas de mercado."
---

# Bolsa Mercantil de Colombia — BEC (Gestor del Mercado de Gas Natural)

BEC es el gestor del mercado de gas natural en Colombia, operado por la Bolsa Mercantil de Colombia. Su función es recopilar y centralizar la información transaccional y operativa del sector bajo principios de neutralidad, transparencia, objetividad e independencia. Administra la plataforma SEGAS (Sistema Electrónico de Gas), publica informes periódicos del mercado y opera los mecanismos de negociación del mercado primario, secundario y subastas conforme a la regulación de la CREG.

## ¿Qué tipo de información produce?

- Información transaccional del mercado primario y secundario: precios, contratos, suministro, transporte y procesos de comercialización y concurrencia
- Datos operativos de producción, transporte y distribución-comercialización del sistema nacional de transporte (SNT)
- Resultados de subastas (de corto y largo plazo, Contratos Firmes Bimestrales, Suministro con Interrupciones)
- Informes periódicos del mercado: diarios, semanales, mensuales, trimestrales, anuales e informes ejecutivos
- Índice iGas-D: precio diario del mercado secundario (acceso público, histórico desde 2019)
- Indicadores CREG del mercado primario y secundario (Resolución CREG 102 015 de 2025)
- Normativa aplicable: resoluciones, contratos marco y boletines del gestor
- Lista de participantes inscritos por categoría

## Sitio oficial

`https://www.bmcbec.com.co/`

## Cómo usar esta skill

1. Consulta `mapa-web.md` para ubicar la sección relevante dentro del sitio.
2. Consulta `fuentes-prioritarias.md` para acceder directamente a sistemas, portales y documentos clave.
3. En el repositorio del Atlas, la carpeta `examples/` reúne casos de análisis reproducibles y consultas de ejemplo con su ruta esperada.

## Notas de navegación

- **SEGAS** (`segas.bmcbec.com.co`) es la plataforma transaccional principal; requiere credenciales de participante registrado. El contenido transaccional público está en la sección Información Transaccional del sitio principal.
- **BI Gas** (tableros Power BI y cubos) requiere login. La sección **Contenido Virtual** (`/contenido-virtual`) ofrece tutoriales y la herramienta **RUT Gas** de estado operativo sin necesidad de cuenta.
- El índice **iGas-D** (iGas Express) es de acceso público: precio diario del mercado secundario con histórico descargable en Excel desde 2019.
- Las secciones de **Información Transaccional** e **Información Operativa** muestran sus datos mediante reportes Power BI embebidos (`app.powerbi.com`). Para acceder a datos crudos estructurados se requiere BI Gas (login) o las descargas de la sección Informes.
- El sitio usa Drupal CMS; algunas URLs aparecen con y sin tilde (`informacion-transaccional` / `informaci%C3%B3n-transaccional`) y son equivalentes. Varias sub-páginas usan URLs `node/XXXX` — los nombres semánticos están en el árbol y las URLs reales en `notas-internas.md`.
