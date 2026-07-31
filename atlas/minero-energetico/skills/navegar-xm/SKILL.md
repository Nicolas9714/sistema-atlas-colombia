---
name: navegar-xm
description: "Guía de navegación para XM: datos operativos y de mercado eléctrico colombiano, hidrología, generación, demanda y cargo por confiabilidad."
---

# XM S.A. E.S.P. — Operador del Sistema y Administrador del Mercado

XM es una filial de ISA que actúa como Operador del Sistema de Transmisión Nacional (STN) y Administrador del Sistema de Intercambios Comerciales (ASIC) del mercado eléctrico colombiano. Es la fuente primaria de datos operativos y de mercado del sistema eléctrico.

## ¿Qué tipo de información produce?

- Datos operativos y de mercado: generación, demanda, hidrología (embalses, reservas, aportes), precios de bolsa y escasez, redespacho diario y horario
- API pública SINERGOX (`servapibi.xm.com.co`): series históricas sin autenticación de hidrología, demanda, oferta, transacciones y emisiones CO2; librería oficial `pydataxm` para Python
- SIMEM (`simem.co`): portal de datos abiertos del mercado eléctrico mayorista, operado conjuntamente con UPME; incluye cargo por confiabilidad, mercado spot, contratos, operación y garantías
- Informes periódicos: boletín energético, análisis mensual de mercado, situación energética actual, informe anual del SIN e IPOEMP semestral
- Planeación operativa del sistema: largo, mediano y corto plazo; estudios de flexibilidad, restricciones y parámetros técnicos
- Subastas de energía firme, cargo por confiabilidad y administración financiera del mercado eléctrico
- FTP público con datos de redespacho diario y horario

## Sitio oficial

`https://www.xm.com.co/`

## Cómo usar esta skill

1. Consulta `mapa-web.md` para ubicar la variable operativa, informe o sección del mercado que necesitas.
2. Consulta `fuentes.md` para acceder directamente a la API SiNERGOX, SIMEM, informes o bases de datos de planeación.
3. En el repositorio del Atlas, la carpeta `examples/` reúne casos de análisis reproducibles y consultas de ejemplo con su ruta esperada.

## Notas de navegación

- La API pública (`servapibi.xm.com.co`) no requiere autenticación y es el acceso recomendado para extraer series históricas de manera programática. La librería `pydataxm` facilita su uso desde Python.
- El portal SINERGOX es para agentes registrados del mercado y requiere autenticación; no confundir con la API pública.
- El SIMEM (`simem.co`) es el portal de datos abiertos del mercado; tiene su propia API documentada en la sección de catálogo de datos.
- Las bases de datos descargables de planeación (MPODE, IPOEL, AEMP) están en `planeación/`, separadas de los resultados de estudios que están en `operación/planeación/`.
