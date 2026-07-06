---
tipo: analisis
entidades: [navegar-upme]
tema: balance energético / consumo final
fecha: 2026-07-06
---

# Consumo final de energía por energético — BECO 2006-2024

## Consulta

"¿Cómo ha evolucionado el consumo final de energía en Colombia por energético (gas natural, diésel, electricidad, leña...) entre 2006 y 2024, según el Balance Energético Colombiano?"

## Cómo se llegó a los datos

UPME → SIMEC → Oferta y Demanda → Balance Energético Colombiano (`simec/oferta-y-demanda/balance-energetico-colombiano/`). El BECO es la estadística oficial de oferta, transformación y consumo de energía del país; la skill `navegar-upme` documenta esta ruta y las demás fuentes estadísticas de la entidad.

## Datos

- **Fuente oficial:** Balance Energético Colombiano (BECO) de la UPME, publicado como libro de Excel en `upme.gov.co/simec/oferta-y-demanda/balance-energetico-colombiano/`.
- **Archivo usado:** `BECO_VER_01_2024_1975_2024.xlsx` (versión 01 de 2024, serie 1975-2024).
- **Obtención:** descargar el Excel desde la página del BECO y ubicarlo en esta carpeta. El archivo crudo NO se incluye en el repositorio; se documenta su origen para que el caso sea reproducible.

## Metodología

El BECO no expone el consumo final por energético como tabla plana: la hoja `BECO_Energéticos 2006-2024` es un formato dinámico que recalcula todo el balance según el energético elegido en un selector (celda `E5`). Por eso el flujo automatiza el propio Excel en lugar de leer celdas estáticas:

1. Se leen los códigos y nombres de los 19 energéticos desde la hoja `BECO_Fuentes`.
2. Para cada energético, se escribe su código en el selector `E5`, se fuerza el recálculo del libro y se lee la fila **CONSUMO FINAL** (fila 41, columnas D-V = años 2006-2024) ya calculada por Excel.
3. Se restaura el selector original y se cierra el libro sin guardar, de modo que el archivo fuente no se modifica.
4. Los valores se convierten de terajulios a petajulios (÷1000) y se exportan a CSV.

Decisión clave: Excel calcula, Python solo orquesta y lee. Así el resultado replica exactamente la lógica interna del BECO sin reimplementar sus fórmulas.

## Herramientas

- Python con `xlwings` (requiere Excel instalado en Windows), `pandas` y `plotly`.
- `consumo_final_beco.ipynb` — notebook con el flujo completo: extracción, exportación y gráfica interactiva (área apilada / líneas).
- `consumo_final_energeticos.csv` — salida generada: consumo final en PJ por energético (filas) y año 2006-2024 (columnas).

## Resultado

Serie de consumo final 2006-2024 para los 19 energéticos del BECO, en petajulios, con gráfica interactiva para comparar composición y tendencias (p. ej. el crecimiento sostenido de diésel, gasolina y electricidad frente al descenso de la leña).

Limitaciones:

- La extracción depende de la estructura interna del libro (hoja `BECO_Energéticos 2006-2024`, selector en `E5`, fila 41): una versión futura del BECO puede mover esas referencias y exigir ajustarlas.
- `xlwings` automatiza Excel de escritorio, por lo que el flujo corre solo en máquinas con Excel (no en Linux ni en CI).
- Los valores reflejan la versión 01 de 2024 del BECO; la UPME puede publicar revisiones.
