---
tipo: navegacion
entidades: [navegar-creg, navegar-superservicios, navegar-xm]
tema: regulación
---

# Descomponer la tarifa de energía eléctrica de una región

## Consulta

"¿Por qué subió la tarifa de energía en la costa Caribe: qué fórmula tarifaria aplica, qué está cobrando efectivamente cada comercializadora y cuánto pesa el precio de bolsa en el alza?"

## Ruta

1. **CREG → Gestor Normativo** (`gestornormativo.creg.gov.co`) y Alejandría: identificar la fórmula tarifaria vigente y sus componentes (generación, transmisión, distribución, comercialización).
2. **Superservicios → SUI** (`sui.superservicios.gov.co`): descargar las tarifas efectivamente aplicadas por las comercializadoras de la región y su evolución mensual.
3. **XM → SINERGOX** (`sinergox.xm.com.co`) o la API pública (`servapibi.xm.com.co`): traer la serie del precio de bolsa del mismo periodo y contrastarla con el componente de generación de la tarifa.
4. Comparar los tres: si la fórmula no cambió y la tarifa sube, el movimiento viene de los componentes de mercado (bolsa y contratos) o de los cargos regulados actualizados.

## Entidades y rutas

- **CREG** — Gestor Normativo (`gestornormativo.creg.gov.co`) y Alejandría: metodologías y fórmulas tarifarias vigentes. Quien define cómo se calcula la tarifa.
- **Superservicios** — SUI (`sui.superservicios.gov.co`): tarifas aplicadas por cada empresa y calidad del servicio. Lo que se cobra en la práctica.
- **XM** — SINERGOX (`sinergox.xm.com.co`) y API pública (`servapibi.xm.com.co`): precio de bolsa y operación del mercado mayorista, el componente de generación.

## Entidades y rutas complementarias

- **UPME** — `simec/energia-electrica/transmision-de-energia-electrica/` y `simec/planeacion-energetica/plan-de-expansion-de-transmision/`: infraestructura y expansión de transmisión, para entender el componente STN de la tarifa.
