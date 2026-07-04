---
entidades: [navegar-anh, navegar-bec, navegar-creg]
tema: mercado de gas
nivel: intermedio
---

# Consultar producción, mercado y regulación del gas natural

## Consulta

"¿Dónde veo la producción de gas natural por campo, cómo consulto el mercado transaccional y quién regula las tarifas del servicio?"

## Entidades y rutas

- **ANH** — Sistemas Integrados de Operaciones (`operaciones-y-regalias/`): producción de gas por campo y operador, con rezago aproximado de un mes. Es la fuente del dato de upstream (producción en boca de pozo).
- **BEC** — SEGAS (`segas.bmcbec.com.co`) e iGas-D: información transaccional del mercado mayorista de gas, precios y subastas. Es el mercado (midstream/comercialización).
- **CREG** — Gestor Normativo y Alejandría: regulación y metodologías tarifarias del transporte y la distribución de gas.

## Notas

- Orden sugerido: ANH (cuánto se produce) → BEC (cómo se transa) → CREG (bajo qué regulación).
- Distinción de roles: la ANH administra el recurso y publica producción; BEC opera el mercado transaccional; la CREG define la regulación y las tarifas.
