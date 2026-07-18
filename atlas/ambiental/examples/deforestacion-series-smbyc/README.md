---
tipo: analisis
entidades: [navegar-ideam]
tema: deforestación
fecha: 2026-07-17
---

# Serie anual de deforestación por departamento — SMByC

## Consulta

"¿Cómo ha evolucionado la deforestación anual en Colombia desde 2013, qué departamentos concentran la pérdida de bosque y qué tendencia muestra la Amazonía?"

## Cómo se llegó a los datos

Portal principal del IDEAM (`ideam.gov.co`) → **Nuestra entidad** → **Ecosistemas e Información Ambiental** → **Sistema de Monitoreo de Bosques y Carbono** → **Informe anual del monitoreo de bosque** (`ideam.gov.co/nuestra-entidad/ecosistemas-e-informacion-ambiental/sistema-monitoreo-bosques-carbono/informe-anual-del-monitoreo-de-bosque`). En esa sección están los anexos de cifras en Excel con la serie histórica de cambio en la superficie de bosque natural, a nivel nacional y departamental.

La sección de datos abiertos del IDEAM, «Resultados del monitoreo de bosques», embebe el mismo tipo de archivos desde `bart.ideam.gov.co/smbyc/` — es la misma familia de anexos, pero los del portal principal son la ruta que respondió de forma estable al construir este caso. La skill `navegar-ideam` documenta ambas rutas y las demás fuentes forestales de la entidad (SNIF, IFN, RNZD).

## Datos

- **Fuente oficial:** anexos de cifras del monitoreo de la superficie de bosque natural y la deforestación del SMByC (IDEAM), actualizados al 31 de octubre de 2025.
- **Archivos usados:**
  - `4.02_d_cambio_bosque_dpto.xlsx` — una hoja por periodo (`1990-2000` ... `2023-2024`), con el cambio en la superficie de bosque natural desagregado por departamento.
  - `4.02_d_cambio_bosque_nacional.xlsx` — hoja `Nacional`, la misma serie de periodos a nivel país.
- **URLs de descarga:**
  - `https://www.ideam.gov.co/sites/default/files/archivos/4.02_d_cambio_bosque_dpto.xlsx`
  - `https://www.ideam.gov.co/sites/default/files/archivos/4.02_d_cambio_bosque_nacional.xlsx`
- **Unidad:** hectáreas (columna "Superficie deforestada — SD" de cada hoja).
- **Cobertura del caso:** serie anual 2013-2024 (año final de cada periodo anual).
- Los archivos `.xlsx` crudos **no se versionan** en el repositorio; se descargan con las URLs anteriores y se ubican en esta carpeta antes de correr el notebook. Sí se versiona el CSV que produce el notebook.

## Metodología

1. Del archivo departamental, tomar únicamente las hojas de periodicidad anual: `2012-2013` en adelante, según la nota metodológica del propio IDEAM (fila 52 de cada hoja). Los periodos `1990-2000`, `2000-2005`, `2005-2010` y `2010-2012` son multianuales y quedan fuera de la serie y de la gráfica.
2. En cada hoja anual, ubicar la fila de encabezado ("Departamento") y extraer Departamento + Superficie deforestada (SD), excluyendo la fila de totales. Construir una tabla departamento × año (año = año final del periodo, ej. 2012-2013 → 2013) en hectáreas.
3. Tomar la serie nacional oficial de `4.02_d_cambio_bosque_nacional.xlsx` (hoja `Nacional`, mismos periodos anuales) en vez de sumar la tabla departamental: el IDEAM advierte que el total nacional y la suma de departamentos pueden diferir levemente por redondeo y por el tratamiento de áreas sin información. En la práctica la diferencia es mínima (del orden de unas pocas hectáreas por año).
4. Agrupar los departamentos amazónicos (Amazonas, Caquetá, Guainía, Guaviare, Putumayo, Vaupés) sumando su deforestación anual, para comparar la tendencia regional contra el total nacional.
5. Exportar la tabla departamento × año a `deforestacion_departamentos.csv` (codificación `utf-8-sig`).
6. Graficar con Plotly: serie nacional oficial, serie amazónica agregada y los departamentos de mayor deforestación promedio en el periodo (líneas punteadas).

## Herramientas

- Python con `pandas`, `openpyxl` y `plotly`.
- `deforestacion_smbyc.ipynb` — notebook con el flujo completo: lectura de hojas anuales, serie nacional oficial, agrupación amazónica, exportación y gráfica.
- `deforestacion_departamentos.csv` — salida generada: hectáreas deforestadas (SD) por departamento (filas, 33 departamentos) y año 2013-2024 (columnas).
- `geovisor/` — geovisor interactivo construido sobre estos datos (ver sección siguiente).

## Geovisor

La carpeta `geovisor/` contiene un geovisor interactivo construido con Leaflet sobre estos datos: mapa base a pantalla completa con tres capas conmutables en un control colapsable, slider de año 2013-2024 con animación, tooltip con hectáreas y ranking nacional, y panel lateral con las cifras del año activo y la serie completa de cada departamento al hacer clic.

- **Capas:** coropleta de deforestación departamental (SMByC — IDEAM), áreas protegidas del RUNAP (Parques Nacionales Naturales, 1.889 áreas descargadas del servicio geográfico oficial de la entidad) y las 7 zonas de la reserva forestal de la Ley 2ª de 1959 (MinAmbiente). Las capas de cruce permiten leer la presión de la deforestación sobre suelo protegido y de vocación forestal.
- Se abre con doble clic en `geovisor/index.html`. Requiere conexión a internet: el mapa base (tiles de CartoDB) y la librería Leaflet se cargan por CDN.
- Arquitectura distribuida: `index.html` (estructura), `estilos.css` (estilos), `app.js` (lógica), `datos.js` (series y departamentos) y una capa por archivo (`capa_areas_protegidas.js`, `capa_reserva_forestal.js`). Actualizar cifras o una capa solo toca su archivo.
- Los datos embebidos provienen del CSV y de la serie nacional oficial de este caso; el contorno departamental proviene del Marco Geoestadístico Nacional (MGN 2018, DANE), simplificado; las capas de cruce se descargaron de los servicios ArcGIS oficiales de Parques Nacionales Naturales y MinAmbiente y se simplificaron para uso web.
- Escala de color por cuantiles (6 grupos, recalculados por año) con una rampa secuencial amarillo–naranja–marrón (ColorBrewer YlOrBr): tonos más oscuros indican mayor deforestación. La interfaz conserva el verde esmeralda de la identidad del Atlas, separado del color temático del mapa, con modo oscuro por defecto y alterne a modo claro.

## Resultado

La deforestación anual en Colombia no muestra una tendencia sostenida en una sola dirección entre 2013 y 2024: parte de 120.938 ha en 2013, alcanza su punto más alto en 2017 con 219.973 ha, toca su mínimo del periodo en 2023 (periodo 2022-2023) con 79.256 ha, y repunta a 113.608 ha en 2024 (periodo 2023-2024), el último dato disponible. Los departamentos amazónicos concentran una fracción muy alta de la pérdida nacional — entre el 31 % y el 53 % según el año, con un pico de 116.161 ha en 2017 — lo que confirma a la Amazonía como el epicentro estructural de la deforestación del país. En el último periodo disponible (2023-2024), Meta (27.106 ha), Caquetá (25.256 ha) y Guaviare (16.943 ha) son los departamentos con mayor superficie deforestada, seguidos por Antioquia (7.207 ha) y Chocó (6.336 ha), lo que sitúa el llamado "arco de deforestación" de la Amazonía nor-occidental como la zona de mayor presión sobre el bosque natural del país.
