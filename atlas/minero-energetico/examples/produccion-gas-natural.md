---
tipo: navegacion
entidades: [navegar-anh, navegar-bec, navegar-creg]
tema: mercado de gas
---

# Seguir el gas natural de la boca de pozo a la tarifa

## Consulta

"¿Cuánto gas natural produjeron los campos de Cusiana-Cupiagua en el último año, a qué precios se está transando el gas en el mercado mayorista y qué regulación fija las tarifas de transporte y distribución?"

## Ruta

1. **ANH → Sistemas Integrados de Operaciones** (`operaciones-y-regalias/`): descargar la producción de gas por campo y operador (rezago aproximado de un mes) y filtrar los campos de interés.
2. **BEC → SEGAS** (`segas.bmcbec.com.co`) e **iGas-D**: consultar precios y resultados de subastas del mercado mayorista para contrastar la producción con lo transado.
3. **CREG → Gestor Normativo y Alejandría**: identificar las resoluciones y metodologías tarifarias vigentes de transporte y distribución de gas.

## Entidades y rutas

- **ANH** — Sistemas Integrados de Operaciones (`operaciones-y-regalias/`): producción de gas por campo y operador. La fuente del dato de upstream (boca de pozo).
- **BEC** — SEGAS (`segas.bmcbec.com.co`) e iGas-D: información transaccional del mercado mayorista, precios y subastas. El mercado (midstream/comercialización).
- **CREG** — Gestor Normativo y Alejandría: regulación y metodologías tarifarias de transporte y distribución.

## Entidades y rutas complementarias

- **UPME** — `simec/planeacion-energetica/plan-de-abastecimiento-de-gas-natural/`: proyecciones de oferta y demanda y balance de abastecimiento, para leer la producción actual contra la trayectoria esperada.
