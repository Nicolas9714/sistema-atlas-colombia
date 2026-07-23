# Consultas de ejemplo

Consultas de demostración: cada una es un prompt que puedes hacerle al agente con las skills del Atlas instaladas, junto con la ruta que debería responderte. Sirven como vitrina de lo que resuelve el Atlas y como referencia para validar que las skills funcionan. Las URLs exactas de cada sistema viven en `fuentes-prioritarias.md` de la skill correspondiente.

---

**«Necesito el perfil de riesgo hidroclimático de Mocoa: amenazas por movimientos en masa e inundación, alertas vigentes y cómo incidirá el clima futuro.»**

Ruta esperada: UNGRD (Atlas de Riesgo y geovisores de amenaza) → IDEAM (alertas FEWS, seguimiento El Niño/La Niña, escenarios de cambio climático) → MinAmbiente (PNACC/PIGCCT como marco de adaptación).

---

**«¿Cuánta deforestación registró el PNN Serranía de Chiribiquete y su zona aledaña en el último año, y qué biodiversidad está bajo presión?»**

Ruta esperada: IDEAM (SMByC: cifras oficiales y alertas tempranas) → PNN (RUNAP: límite oficial del área) → cruce de capas en SIG → IAvH (BioModelos/BioTablero: especies e indicadores) → MinAmbiente (Visión Amazonía como contexto de política).

---

**«Voy a tramitar la licencia ambiental de un proyecto vial ante la ANLA: requisitos, términos de referencia, antecedentes en la zona y línea base hidrometeorológica.»**

Ruta esperada: ANLA (trámites y tipos de licencia) → MinAmbiente (Decreto 1076 de 2015 y términos de referencia del sector) → ANLA (Geovisor Público, VITAL y GACETA para proyectos vecinos) → IDEAM (DHIME/SIRH para la línea base).

---

**«Necesito el diagnóstico de la cuenca del río Bogotá: caudales, calidad del agua y qué concesiones y vertimientos licenciados la presionan.»**

Ruta esperada: IDEAM (DHIME: series de caudales; SIRH: calidad) → ANLA (VITAL y geovisor: concesiones y vertimientos por proyecto) → MinAmbiente (SIRH en el SIAC y Política de Gestión Integral del Recurso Hídrico).

---

**«¿Cómo ha evolucionado el PM2.5 en el Valle de Aburrá, qué fuentes fijas licenciadas emiten en la zona y contra qué norma se compara?»**

Ruta esperada: IDEAM (SISAIRE: series por estación; RETC: inventario de emisiones) → ANLA (tableros de calidad del aire de proyectos licenciados; expedientes de fuentes fijas de competencia nacional vía VITAL) → MinAmbiente (estándares de calidad del aire vigentes).

---

**«¿Qué tan avanzada está la erosión costera en el litoral de Córdoba, en qué estado están las aguas y ecosistemas marinos adyacentes y qué pérdidas proyecta el riesgo?»**

Ruta esperada: INVEMAR (SIAM: indicadores IECC, ICAM e ICTAC con su geovisor) → UNGRD (geovisor de erosión costera y Atlas de Riesgo: vulnerabilidad y pérdidas esperadas) → IDEAM (nivel del mar, oleaje y variabilidad climática).
