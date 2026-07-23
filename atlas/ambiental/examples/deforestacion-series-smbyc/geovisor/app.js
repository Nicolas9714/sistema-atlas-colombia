/* =====================================================================
   app.js — geovisor de deforestación departamental (Leaflet)
   Atlas de Navegación Ambiental de Colombia
   ===================================================================== */

const SVGNS = "http://www.w3.org/2000/svg";
const ACC = "#3ECF8E";          // esmeralda: marca/UI, títulos, controles y serie histórica
const COLOR_RUNAP = "#38BDF8";  // azul: áreas protegidas RUNAP
const COLOR_RESERVA = "#F59E0B"; // ámbar: reserva forestal Ley 2ª

// Rampa secuencial ColorBrewer YlOrBr (6 clases): independiente del verde
// de la interfaz; marrón más oscuro = mayor deforestación.
const RAMPA_COROPLETA = ["#FFFFD4", "#FEE391", "#FEC44F", "#FE9929", "#D95F0E", "#993404"];
const FILL_OPACITY_COROPLETA = 0.75;

// Bordes de la coropleta: neutros del tema para no competir con la rampa.
function colorBordeNeutro() {
  return getComputedStyle(document.documentElement).getPropertyValue("--fg-secundario").trim();
}
function colorBordeContraste() {
  return document.documentElement.dataset.theme === "claro" ? "#1F2937" : "#FFFFFF";
}

/* ---------------------------------------------------------------------
   Formato de números en español
   --------------------------------------------------------------------- */
function formatoHa(v) {
  return Math.round(v).toLocaleString("es-CO") + " ha";
}
function formatoEntero(v) {
  return Math.round(v).toLocaleString("es-CO");
}
function formatoPorcentaje(v) {
  return v.toLocaleString("es-CO", { minimumFractionDigits: 1, maximumFractionDigits: 1 }) + " %";
}
/* ---------------------------------------------------------------------
   Estado global
   --------------------------------------------------------------------- */
const NOMBRES_DEPTOS = Object.keys(SERIE_DEPARTAMENTOS);

const estado = {
  idxAnio: 0,
  reproduciendo: false,
  idIntervalo: null,
  deptoSeleccionado: null,
  capas: { coropleta: true, runap: false, reserva: false }
};

/* ---------------------------------------------------------------------
   Cálculos por año
   --------------------------------------------------------------------- */
// Escala de color: 6 grupos por CUANTILES, recalculados cada año.
// Se eligió cuantiles (no escala continua) porque la distribución de
// hectáreas deforestadas por departamento es muy asimétrica: unos pocos
// departamentos concentran la mayor parte del área y muchos otros quedan
// cerca de cero. Con cuantiles, cada año se reparte la misma cantidad de
// departamentos en cada uno de los 6 tonos, así que la variación relativa
// siempre es visible en el mapa. Cada clase se pinta con un tono de la
// rampa RAMPA_COROPLETA (más oscuro/marrón = mayor deforestación).

function valoresDelAnio(idxAnio) {
  const obj = {};
  NOMBRES_DEPTOS.forEach(nombre => {
    obj[nombre] = SERIE_DEPARTAMENTOS[nombre][idxAnio];
  });
  return obj;
}

function calcularCortes(valores) {
  const ordenados = [...valores].sort((a, b) => a - b);
  const n = ordenados.length;
  const cortes = [];
  for (let i = 1; i <= 5; i++) {
    const idx = Math.min(n - 1, Math.max(0, Math.round((i / 6) * n) - 1));
    cortes.push(ordenados[idx]);
  }
  return cortes;
}

function claseDeCorte(valor, cortes) {
  for (let i = 0; i < cortes.length; i++) {
    if (valor <= cortes[i]) return i;
  }
  return cortes.length;
}

function rankingDelDepto(nombre, idxAnio) {
  const valores = valoresDelAnio(idxAnio);
  const ordenado = NOMBRES_DEPTOS.slice().sort((a, b) => valores[b] - valores[a]);
  const pos = ordenado.indexOf(nombre) + 1;
  return `${pos}.º de ${NOMBRES_DEPTOS.length}`;
}

/* ---------------------------------------------------------------------
   Mapa Leaflet: base, capas de tema
   --------------------------------------------------------------------- */
const mapa = L.map("lienzo-mapa", {
  center: [4.6, -74],
  zoom: 6,
  minZoom: 4,
  maxZoom: 12,
  zoomControl: true,
  attributionControl: true
});

const TILES_OSCURO = L.tileLayer("https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png", {
  attribution: '&copy; OpenStreetMap, &copy; CARTO',
  subdomains: "abcd",
  maxZoom: 19
});
const TILES_CLARO = L.tileLayer("https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png", {
  attribution: '&copy; OpenStreetMap, &copy; CARTO',
  subdomains: "abcd",
  maxZoom: 19
});

let capaTilesActiva = TILES_OSCURO;
capaTilesActiva.addTo(mapa);

/* ---------------------------------------------------------------------
   Capa 1: coropleta departamental
   --------------------------------------------------------------------- */
let capaCoropleta = null;

function estiloDepto(feature, valores, cortes) {
  const nombre = feature.properties.nombre;
  const valor = valores[nombre] || 0;
  const clase = claseDeCorte(valor, cortes);
  const seleccionado = estado.deptoSeleccionado === nombre;
  return {
    color: seleccionado ? colorBordeContraste() : colorBordeNeutro(),
    weight: seleccionado ? 2.4 : 0.8,
    opacity: seleccionado ? 1 : 0.6,
    fillColor: RAMPA_COROPLETA[clase],
    fillOpacity: FILL_OPACITY_COROPLETA
  };
}

function construirCapaCoropleta() {
  const valores = valoresDelAnio(estado.idxAnio);
  const cortes = calcularCortes(Object.values(valores));

  capaCoropleta = L.geoJSON(GEOJSON_DEPARTAMENTOS, {
    style: feature => estiloDepto(feature, valores, cortes),
    onEachFeature: (feature, layer) => {
      const nombre = feature.properties.nombre;
      const valor = valores[nombre] || 0;
      const ranking = rankingDelDepto(nombre, estado.idxAnio);
      layer.bindTooltip(
        `<b>${NOMBRES_VISIBLES[nombre]}</b>${formatoHa(valor)} en ${ANIOS[estado.idxAnio]}<br>${ranking} en deforestación`,
        { className: "tooltip-atlas", sticky: true }
      );
      layer.on("mouseover", () => {
        if (estado.deptoSeleccionado !== nombre) layer.setStyle({ weight: 2.2, color: colorBordeContraste(), opacity: 1 });
      });
      layer.on("mouseout", () => {
        if (estado.deptoSeleccionado !== nombre) layer.setStyle({ weight: 0.8, color: colorBordeNeutro(), opacity: 0.6 });
      });
      layer.on("click", () => abrirPanelDepto(nombre));
    }
  });

  renderLeyenda(cortes);
  return capaCoropleta;
}

function actualizarCapaCoropleta() {
  if (capaCoropleta) mapa.removeLayer(capaCoropleta);
  capaCoropleta = construirCapaCoropleta();
  if (estado.capas.coropleta) capaCoropleta.addTo(mapa);
}

/* ---------------------------------------------------------------------
   Capa 2: áreas protegidas (RUNAP / Parques Nacionales Naturales)
   --------------------------------------------------------------------- */
const capaRunap = L.geoJSON(
  (typeof CAPA_AREAS_PROTEGIDAS !== "undefined") ? CAPA_AREAS_PROTEGIDAS : { type: "FeatureCollection", features: [] },
  {
    style: {
      color: COLOR_RUNAP,
      weight: 1.3,
      opacity: 0.85,
      dashArray: "4,5",
      fillColor: COLOR_RUNAP,
      fillOpacity: 0.1
    },
    onEachFeature: (feature, layer) => {
      const props = feature.properties || {};
      const nombre = props.nombre || "Área protegida";
      const categoria = props.categoria || "";
      layer.bindPopup(
        `<b style="color:${COLOR_RUNAP}">${nombre}</b>${categoria ? categoria + "<br>" : ""}RUNAP — Parques Nacionales Naturales`
      );
    }
  }
);

/* ---------------------------------------------------------------------
   Capa 3: reserva forestal Ley 2ª de 1959
   --------------------------------------------------------------------- */
const capaReserva = L.geoJSON(
  (typeof CAPA_RESERVA_FORESTAL !== "undefined") ? CAPA_RESERVA_FORESTAL : { type: "FeatureCollection", features: [] },
  {
    style: {
      color: COLOR_RESERVA,
      weight: 1.1,
      opacity: 0.75,
      dashArray: "10,6",
      fillColor: COLOR_RESERVA,
      fillOpacity: 0.08
    },
    onEachFeature: (feature, layer) => {
      const props = feature.properties || {};
      const nombre = props.nombre || "Zona de reserva forestal";
      const areaHa = props.area_ha ? formatoHa(props.area_ha) : "";
      layer.bindPopup(
        `<b style="color:${COLOR_RESERVA}">Reserva forestal ${nombre}</b>${areaHa ? areaHa + "<br>" : ""}Ley 2ª de 1959 — MinAmbiente`
      );
    }
  }
);

/* ---------------------------------------------------------------------
   Toggle de capas
   --------------------------------------------------------------------- */
function alternarCapa(nombreCapa) {
  estado.capas[nombreCapa] = !estado.capas[nombreCapa];
  const boton = document.querySelector(`.btn[data-capa="${nombreCapa}"]`);
  boton.classList.toggle("activo", estado.capas[nombreCapa]);

  const capasLeaflet = { coropleta: capaCoropleta, runap: capaRunap, reserva: capaReserva };
  const capa = capasLeaflet[nombreCapa];
  if (!capa) return;
  if (estado.capas[nombreCapa]) capa.addTo(mapa);
  else mapa.removeLayer(capa);
}

document.querySelectorAll(".btn[data-capa]").forEach(boton => {
  boton.addEventListener("click", () => alternarCapa(boton.dataset.capa));
});

/* ---------------------------------------------------------------------
   Panel profesional de capas: colapsable, accesible y compacto
   --------------------------------------------------------------------- */
document.getElementById("btn-colapsar-capas").addEventListener("click", function () {
  const panel = document.getElementById("controles-izq");
  const quedaColapsado = !panel.classList.contains("colapsado");
  panel.classList.toggle("colapsado", quedaColapsado);
  this.setAttribute("aria-expanded", String(!quedaColapsado));
  this.querySelector(".chevron-control").textContent = quedaColapsado ? "⌄" : "⌃";
});

/* ---------------------------------------------------------------------
   Leyenda de la coropleta
   --------------------------------------------------------------------- */
function renderLeyenda(cortes) {
  const cont = document.getElementById("escala-leyenda");
  cont.innerHTML = "";

  const direccion = document.createElement("div");
  direccion.className = "leyenda-direccion";
  direccion.innerHTML = "<span>Menor</span><span>Mayor</span>";
  cont.appendChild(direccion);

  RAMPA_COROPLETA.forEach((color, i) => {
    const bloque = document.createElement("div");
    bloque.className = "bloque-leyenda";
    const muestra = document.createElement("span");
    muestra.className = "muestra-leyenda";
    muestra.style.background = color;
    bloque.appendChild(muestra);
    const rango = document.createElement("span");
    const desde = i === 0 ? 0 : Math.round(cortes[i - 1]);
    const hasta = i < cortes.length ? Math.round(cortes[i]) : null;
    rango.textContent = hasta === null
      ? `> ${formatoEntero(desde)} ha`
      : `${formatoEntero(desde)}–${formatoEntero(hasta)} ha`;
    bloque.appendChild(rango);
    cont.appendChild(bloque);
  });
}

/* ---------------------------------------------------------------------
   Cifras del encabezado (ahora dentro del sidebar)
   --------------------------------------------------------------------- */
function renderCifras() {
  const anio = ANIOS[estado.idxAnio];
  document.getElementById("cifra-anio").textContent = anio;
  document.getElementById("etiqueta-slider").textContent = anio;

  const nacional = SERIE_NACIONAL[estado.idxAnio];
  document.getElementById("cifra-nacional").textContent = formatoHa(nacional);

  const sumaAmazonia = DEPARTAMENTOS_AMAZONIA.reduce(
    (acc, nombre) => acc + SERIE_DEPARTAMENTOS[nombre][estado.idxAnio], 0
  );
  const porcentaje = (sumaAmazonia / nacional) * 100;
  document.getElementById("cifra-amazonia").textContent =
    `${formatoPorcentaje(porcentaje)} (${formatoHa(sumaAmazonia)})`;
}

/* ---------------------------------------------------------------------
   Panel lateral: serie histórica de un departamento (sparkline SVG)
   --------------------------------------------------------------------- */
function crearSvg(tag, attrs) {
  const el = document.createElementNS(SVGNS, tag);
  if (attrs) for (const k in attrs) el.setAttribute(k, attrs[k]);
  return el;
}
function crearTexto(x, y, contenido, attrs) {
  const t = crearSvg("text", Object.assign({ x, y, "font-size": 10 }, attrs || {}));
  t.textContent = contenido;
  return t;
}

function abrirPanelDepto(nombre) {
  estado.deptoSeleccionado = nombre;
  document.getElementById("depto-titulo").textContent = NOMBRES_VISIBLES[nombre];

  const serie = SERIE_DEPARTAMENTOS[nombre];
  const ranking = rankingDelDepto(nombre, estado.idxAnio);
  document.getElementById("depto-subtitulo").textContent =
    `${formatoHa(serie[estado.idxAnio])} en ${ANIOS[estado.idxAnio]} · ${ranking} entre los departamentos.`;

  renderSerieDepto(nombre);
  actualizarCapaCoropleta();
}

function renderSerieDepto(nombre) {
  const cont = document.getElementById("lienzo-serie");
  cont.innerHTML = "";
  const serie = SERIE_DEPARTAMENTOS[nombre];

  const W = 300, H = 180;
  const margen = { izq: 40, der: 10, arriba: 16, abajo: 20 };
  const svg = crearSvg("svg", { viewBox: `0 0 ${W} ${H}`, style: "display:block" });
  cont.appendChild(svg);

  const max = Math.max(...serie);
  const min = Math.min(...serie);
  const idxMax = serie.indexOf(max);
  const idxMin = serie.indexOf(min);

  const anchoUtil = W - margen.izq - margen.der;
  const altoUtil = H - margen.arriba - margen.abajo;

  const x = i => margen.izq + (i / (ANIOS.length - 1)) * anchoUtil;
  const y = v => margen.arriba + altoUtil - ((v - min) / ((max - min) || 1)) * altoUtil;

  svg.appendChild(crearSvg("line", { x1: margen.izq, y1: margen.arriba, x2: margen.izq, y2: H - margen.abajo, stroke: ACC, "stroke-width": 0.7, opacity: 0.4 }));
  svg.appendChild(crearSvg("line", { x1: margen.izq, y1: H - margen.abajo, x2: W - margen.der, y2: H - margen.abajo, stroke: ACC, "stroke-width": 0.7, opacity: 0.4 }));

  const puntos = serie.map((v, i) => `${x(i)},${y(v)}`).join(" ");
  svg.appendChild(crearSvg("polyline", { points: puntos, fill: "none", stroke: ACC, "stroke-width": 1.4 }));

  [0, ANIOS.length - 1].forEach(i => {
    svg.appendChild(crearTexto(x(i), H - 5, ANIOS[i], { "font-size": 8, "text-anchor": i === 0 ? "start" : "end", opacity: 0.6 }));
  });

  const xActivo = x(estado.idxAnio);
  svg.appendChild(crearSvg("line", { x1: xActivo, y1: margen.arriba, x2: xActivo, y2: H - margen.abajo, stroke: ACC, "stroke-width": 0.8, "stroke-dasharray": "2,3", opacity: 0.5 }));

  svg.appendChild(crearSvg("circle", { cx: x(idxMax), cy: y(max), r: 3, fill: ACC }));
  svg.appendChild(crearTexto(x(idxMax), y(max) - 7, `máx ${formatoEntero(max)} ha (${ANIOS[idxMax]})`, {
    "font-size": 8, "text-anchor": idxMax > ANIOS.length / 2 ? "end" : "start", "font-weight": 600
  }));

  svg.appendChild(crearSvg("circle", { cx: x(idxMin), cy: y(min), r: 3, fill: "none", stroke: ACC, "stroke-width": 1.2 }));
  svg.appendChild(crearTexto(x(idxMin), y(min) + 12, `mín ${formatoEntero(min)} ha (${ANIOS[idxMin]})`, {
    "font-size": 8, "text-anchor": idxMin > ANIOS.length / 2 ? "end" : "start", opacity: 0.75
  }));

  serie.forEach((v, i) => {
    const c = crearSvg("circle", { cx: x(i), cy: y(v), r: 2, fill: ACC, opacity: i === estado.idxAnio ? 1 : 0.35 });
    const titulo = crearSvg("title", {});
    titulo.textContent = `${ANIOS[i]}: ${formatoHa(v)}`;
    c.appendChild(titulo);
    svg.appendChild(c);
  });
}

/* ---------------------------------------------------------------------
   Slider de años + animación reproducir/pausar
   --------------------------------------------------------------------- */
const slider = document.getElementById("slider-anio");
const btnReproducir = document.getElementById("btn-reproducir");

function fijarAnio(idx) {
  estado.idxAnio = Math.max(0, Math.min(ANIOS.length - 1, idx));
  slider.value = estado.idxAnio;
  renderCifras();
  actualizarCapaCoropleta();
  if (estado.deptoSeleccionado) {
    const serie = SERIE_DEPARTAMENTOS[estado.deptoSeleccionado];
    document.getElementById("depto-subtitulo").textContent =
      `${formatoHa(serie[estado.idxAnio])} en ${ANIOS[estado.idxAnio]} · ${rankingDelDepto(estado.deptoSeleccionado, estado.idxAnio)} entre los departamentos.`;
    renderSerieDepto(estado.deptoSeleccionado);
  }
}

slider.addEventListener("input", () => {
  detenerReproduccion();
  fijarAnio(parseInt(slider.value, 10));
});

function iniciarReproduccion() {
  estado.reproduciendo = true;
  btnReproducir.textContent = "⏸";
  btnReproducir.classList.add("activo");
  estado.idIntervalo = setInterval(() => {
    let siguiente = estado.idxAnio + 1;
    if (siguiente > ANIOS.length - 1) siguiente = 0;
    fijarAnio(siguiente);
  }, 1000);
}
function detenerReproduccion() {
  estado.reproduciendo = false;
  btnReproducir.textContent = "▶";
  btnReproducir.classList.remove("activo");
  if (estado.idIntervalo) clearInterval(estado.idIntervalo);
  estado.idIntervalo = null;
}
btnReproducir.addEventListener("click", () => {
  if (estado.reproduciendo) detenerReproduccion();
  else iniciarReproduccion();
});

/* ---------------------------------------------------------------------
   Colapso del sidebar
   --------------------------------------------------------------------- */
document.getElementById("btn-colapsar-sidebar").addEventListener("click", function () {
  const contenido = document.getElementById("contenido-sidebar");
  const pie = document.getElementById("pie-sidebar");
  const colapsado = contenido.style.display === "none";
  contenido.style.display = colapsado ? "grid" : "none";
  pie.style.display = colapsado ? "block" : "none";
  this.textContent = colapsado ? "−" : "+";
});

/* ---------------------------------------------------------------------
   Modo claro / oscuro (oscuro por defecto) — panel y mapa
   --------------------------------------------------------------------- */
const btnTema = document.getElementById("modo-tema");
function aplicarTema(t) {
  if (t === "claro") document.documentElement.dataset.theme = "claro";
  else delete document.documentElement.dataset.theme;
  btnTema.textContent = t === "claro" ? "Modo oscuro" : "Modo claro";

  const nuevaCapaTiles = t === "claro" ? TILES_CLARO : TILES_OSCURO;
  if (nuevaCapaTiles !== capaTilesActiva) {
    mapa.removeLayer(capaTilesActiva);
    nuevaCapaTiles.addTo(mapa);
    capaTilesActiva = nuevaCapaTiles;
  }
  // Los bordes neutro/contraste de la coropleta dependen del tema: se recalculan.
  if (capaCoropleta) actualizarCapaCoropleta();
  try { localStorage.setItem("tema-geovisor-deforestacion", t); } catch (e) {}
}
btnTema.addEventListener("click", () => {
  aplicarTema(document.documentElement.dataset.theme === "claro" ? "oscuro" : "claro");
});
let temaInicial = "oscuro";
try { if (localStorage.getItem("tema-geovisor-deforestacion") === "claro") temaInicial = "claro"; } catch (e) {}
aplicarTema(temaInicial);

/* ---------------------------------------------------------------------
   Inicio
   --------------------------------------------------------------------- */
fijarAnio(0);
