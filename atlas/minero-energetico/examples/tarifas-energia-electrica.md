---
tipo: navegacion
entidades: [navegar-creg, navegar-superservicios, navegar-xm]
tema: regulación
nivel: intermedio
---

# Entender y consultar las tarifas de energía eléctrica

## Consulta

"¿Qué entidad define la metodología tarifaria de energía eléctrica, dónde consulto las tarifas que cobran las empresas y cómo se relacionan con los precios del mercado?"

## Entidades y rutas

- **CREG** — Gestor Normativo (`gestornormativo.creg.gov.co`) y el sistema Alejandría: metodologías y fórmulas tarifarias vigentes (generación, transmisión, distribución y comercialización). Es quien define cómo se calcula la tarifa.
- **Superservicios** — SUI (`sui.superservicios.gov.co`): tarifas efectivamente aplicadas por cada empresa comercializadora y datos de calidad del servicio. Es el dato de lo que se cobra en la práctica.
- **XM** — SINERGOX (`sinergox.xm.com.co`) y la API pública (`servapibi.xm.com.co`): precio de bolsa y operación del mercado mayorista, el componente de generación que alimenta la tarifa.

## Entidades y rutas complementarias

- **UPME** — `simec/energia-electrica/transmision-de-energia-electrica/` y `simec/planeacion-energetica/plan-de-expansion-de-transmision/`: infraestructura de transmisión y expansión planeada, para entender el componente de transmisión (STN) que pesa en la tarifa.

## Notas

- Orden sugerido: CREG (la regla) → Superservicios (la tarifa aplicada) → XM (el precio de mercado subyacente).
- Distinción de roles: la CREG regula el diseño y los cargos del mercado; XM publica precios de bolsa y operación; Superservicios vigila y publica lo que cobran los prestadores.
- El SUI es de consulta pública; el cargue de datos requiere autenticación de prestador.
