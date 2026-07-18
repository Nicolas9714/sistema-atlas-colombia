/* =====================================================================
   capa_recorrido.js -- recorrido del centro de gravedad de la deforestación
   departamental, 2013-2024 (Atlas de Navegación Ambiental de Colombia).

   Metodología:
   1. Centroide de cada departamento: se calculó con la fórmula del
      polígono (shoelace) sobre el anillo mayor (exterior) de la geometría
      de GEOJSON_DEPARTAMENTOS en datos.js. Es una aproximación geométrica
      simple (no un centroide poblacional ni de bosque remanente).
   2. Centro medio ponderado (weighted mean center) de cada año:
      lon_c = Σ(lon_i · ha_i) / Σha_i,  lat_c = Σ(lat_i · ha_i) / Σha_i
      donde ha_i son las hectáreas deforestadas del departamento i en ese
      año (SERIE_DEPARTAMENTOS de datos.js). Los departamentos con 0 ha no
      aportan al promedio.
   3. Distancia entre años consecutivos: fórmula de haversine (radio medio
      terrestre 6 371,0088 km). Rumbo cardinal: bearing inicial entre los
      dos puntos, redondeado a 1 de 8 sectores de 45° (N, NE, E, SE, S,
      SO, O, NO).

   Limitación de resolución: el centro se calcula a partir de un único
   centroide por departamento (33 unidades administrativas), no de la
   ubicación real de los focos de deforestación dentro de cada uno. Por
   eso el recorrido indica una TENDENCIA REGIONAL del centro de gravedad
   (p. ej. hacia el eje Meta-Caquetá-Guaviare en años de pico amazónico),
   no la trayectoria exacta del frente de deforestación.
   ===================================================================== */

const CAPA_RECORRIDO = [
  { anio: 2013, lat: 3.4754, lon: -73.8225, distanciaKm: null, rumbo: null },
  { anio: 2014, lat: 4.1002, lon: -74.1962, distanciaKm: 80.90, rumbo: "NO" },
  { anio: 2015, lat: 3.8148, lon: -74.1663, distanciaKm: 31.91, rumbo: "S" },
  { anio: 2016, lat: 4.2763, lon: -74.2767, distanciaKm: 52.75, rumbo: "N" },
  { anio: 2017, lat: 3.0390, lon: -73.7801, distanciaKm: 148.20, rumbo: "S" },
  { anio: 2018, lat: 3.0553, lon: -73.4475, distanciaKm: 36.97, rumbo: "E" },
  { anio: 2019, lat: 3.5176, lon: -73.6791, distanciaKm: 57.48, rumbo: "NO" },
  { anio: 2020, lat: 3.3215, lon: -73.7245, distanciaKm: 22.38, rumbo: "S" },
  { anio: 2021, lat: 3.2158, lon: -73.7433, distanciaKm: 11.94, rumbo: "S" },
  { anio: 2022, lat: 3.5849, lon: -73.9285, distanciaKm: 45.91, rumbo: "NO" },
  { anio: 2023, lat: 3.6929, lon: -73.6373, distanciaKm: 34.48, rumbo: "E" },
  { anio: 2024, lat: 3.2026, lon: -73.5701, distanciaKm: 55.03, rumbo: "S" }
];
