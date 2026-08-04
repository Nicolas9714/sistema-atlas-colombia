# Registro de atlas

Único lugar del Sistema con el conocimiento estructural: qué atlas existen y qué entidades cubre cada uno. Registra conjuntos cerrados y verificables; el enrutamiento entre sectores lo resuelve el nodo nacional a partir de la consulta.

## Atlas registrados

| Atlas | Sector | Repositorio | Estándar declarado |
| --- | --- | --- | --- |
| Atlas de Navegación Minero Energético de Colombia | Minero energético | [`atlas/minero-energetico/`](atlas/minero-energetico/) | v0.1 |
| Atlas de Navegación Ambiental de Colombia | Ambiental | [`atlas/ambiental/`](atlas/ambiental/) | v0.1 |

> La columna **Repositorio** es heterogénea: los atlas fundadores viven como subcarpetas de este monorepo (`atlas/<sector>/`), mientras que un atlas de un tercero puede vivir como repositorio propio y aparecería con su URL. Ambos layouts son conformes al estándar (ver [`estandar/especificacion.md`](estandar/especificacion.md), sección «Layout conforme»).

**En construcción:** el Atlas Intersectorial (`atlas/intersectorial/`) alojará las entidades transversales que sirven a todos los sectores por igual (DANE, DNP y futuras). Aún no se registra: sus skills (`navegar-dane`, `navegar-dnp`) son marcadores sin poblar y todavía no existe su orquestadora `atlas-orquestador-intersectorial`, así que no cumple N1–N5.

**En construcción:** el Atlas Transporte (`atlas/transporte/`) alojará al Ministerio de Transporte, la ANI, INVÍAS, Aerocivil, Supertransporte y la ANSV. Sus seis skills son marcadores sin poblar y todavía no existe su orquestadora `atlas-orquestador-transporte`, así que tampoco cumple N1–N5.

## Entidades por atlas

### Atlas de Navegación Minero Energético de Colombia — 12 entidades

| Skill | Entidad | Rol principal |
| --- | --- | --- |
| `navegar-minenergia` | MinEnergía | Política sectorial |
| `navegar-upme` | UPME | Planeación minero-energética |
| `navegar-creg` | CREG | Regulación de energía y gas |
| `navegar-anh` | ANH | Administración de hidrocarburos |
| `navegar-anm` | ANM | Administración minera |
| `navegar-sgc` | SGC | Geología y recursos del subsuelo |
| `navegar-xm` | XM | Operación del sistema eléctrico |
| `navegar-ecopetrol` | Ecopetrol | Cadena de hidrocarburos e información corporativa sectorial |
| `navegar-ipse` | IPSE | Energía en zonas no interconectadas |
| `navegar-fenoge` | FENOGE | Energías no convencionales y eficiencia |
| `navegar-superservicios` | Superservicios | Vigilancia de servicios públicos |
| `navegar-bec` | BEC | Gestor del mercado de gas natural |

### Atlas de Navegación Ambiental de Colombia — 7 entidades

| Skill | Entidad | Rol principal |
| --- | --- | --- |
| `navegar-minambiente` | MinAmbiente | Política ambiental nacional |
| `navegar-anla` | ANLA | Licenciamiento ambiental |
| `navegar-ideam` | IDEAM | Hidrología, meteorología y estudios ambientales |
| `navegar-iavh` | IAvH | Investigación en biodiversidad |
| `navegar-invemar` | INVEMAR | Investigación marina y costera |
| `navegar-pnn` | Parques Nacionales Naturales | Áreas protegidas |
| `navegar-ungrd` | UNGRD | Gestión del riesgo de desastres |

## Cómo registrar un atlas nuevo

1. El atlas cumple la parte normativa de [`estandar/especificacion.md`](estandar/especificacion.md) y declara la versión que cumple.
2. Pull request a este archivo: fila en la tabla de atlas registrados y su tabla de entidades. En el mismo cambio, al menos una consulta de `examples/consultas-de-ejemplo.md` que cruce hacia un atlas ya registrado.
3. El mismo pull request agrega la tarjeta del atlas al banner del `README.md` (logo en `atlas/<sector>/assets/` si el atlas es subcarpeta del monorepo, o en el `assets/` de su propio repo si es externo; más el nombre del atlas enlazado) y su fila en la tabla de atlas del README.
