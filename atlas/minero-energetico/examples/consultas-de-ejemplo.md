# Consultas de ejemplo

Consultas de demostración: cada una es un prompt que puedes hacerle al agente con las skills del Atlas instaladas, junto con la ruta que debería responderte. Sirven como vitrina de lo que resuelve el Atlas y como referencia para validar que las skills funcionan. Las URLs exactas de cada sistema viven en `fuentes-prioritarias.md` de la skill correspondiente.

---

**«¿Qué localidades del Chocó están en la ZNI, cuántas horas de servicio reciben hoy y qué proyectos de energización están en curso?»**

Ruta esperada: IPSE (Centro Nacional de Monitoreo: telemetría del servicio; SIGIPSE: proyectos) → UPME (cobertura eléctrica y plan PERS) → MinEnergía (programas de electrificación rural).

---

**«Necesito la línea base estadística para un informe de política energética: balance energético, producción y consumo por fuente y precios del mercado.»**

Ruta esperada: UPME (BECO y tableros de indicadores) → MinEnergía (IntegraME) → XM (SIMEM: series de generación, demanda y precios) → SGC (datos abiertos del subsuelo). El caso `balance-energetico-consumo-final/` muestra el procesamiento reproducible del BECO.

---

**«¿Qué títulos y solicitudes mineras existen en el suroeste de Antioquia, qué potencial geológico tiene la zona y qué restricciones ambientales la limitan?»**

Ruta esperada: ANM (AnnA Minería: cuadrícula y títulos) → SGC (mapa geológico MIIG y SIMMA) → ANLA (geovisor: regionalización) → MinAmbiente (delimitación de páramos y áreas protegidas).

---

**«¿Qué proyectos de hidrocarburos con licencia activa operan en el Magdalena Medio, qué obligaciones ambientales tienen y qué muestra el monitoreo de sus cuencas?»**

Ruta esperada: ANLA (geovisor, capa de seguimiento: licencias, inversión 1%, compensaciones) → ANH (mapa de tierras y normativa sectorial) → IDEAM (DHIME: series hidrométricas) → MinAmbiente (marco del recurso hídrico).

---

**«Evalúo invertir en transmisión eléctrica: ¿qué convocatorias están abiertas, qué precios dejaron las subastas recientes y bajo qué reglas se remunera un proyecto?»**

Ruta esperada: UPME (convocatorias de transmisión y subastas) → CREG (resoluciones y contratos de conexión) → XM (resultados de subastas y operación) → Ecopetrol (kit del inversionista, si hay exposición accionaria).

---

**«¿Cuánto gas natural produjeron los campos de Cusiana-Cupiagua el último año, a qué precios se transa el gas mayorista y quién regula el transporte?»**

Ruta esperada: ANH (Sistemas Integrados de Operaciones: producción por campo) → BEC (SEGAS e iGas-D: precios y subastas del mercado) → CREG (metodologías tarifarias de transporte y distribución) → UPME (plan de abastecimiento, como contraste).

---

**«¿Por qué subió la tarifa de energía en la costa Caribe: qué fórmula aplica, qué cobra cada comercializadora y cuánto pesa el precio de bolsa?»**

Ruta esperada: CREG (Gestor Normativo: fórmula tarifaria y componentes) → Superservicios (SUI: tarifas aplicadas por empresa) → XM (SINERGOX o API: serie del precio de bolsa) → comparación de los tres niveles.

---

**«¿Cuánta capacidad solar y eólica entró en operación frente a la meta 6GW, qué proyectos siguen en licenciamiento y cuánto generan los que ya operan?»**

Ruta esperada: MinEnergía (Plan 6GW+: monitoreo oficial) → ANLA (Geovisor Público y Eureka: estado del licenciamiento) → XM (SIMEM: generación horaria por fuente) → UPME (plan de expansión y potencial energético).
