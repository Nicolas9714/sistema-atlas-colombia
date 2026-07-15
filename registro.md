# Registro de atlas

Único lugar de la red con el conocimiento estructural: qué atlas existen, qué entidades cubre cada uno y qué temas cruzan sus fronteras. Las skills de los atlas no declaran dependencias entre sectores — toda frontera se declara aquí.

## Atlas registrados

| Atlas | Sigla | Sector | Repositorio | Estándar declarado |
| --- | --- | --- | --- | --- |
| Atlas de Navegación Minero Energético de Colombia | ANMEC | Minero energético | [atlas-minero-energetico-colombia](https://github.com/Nicolas9714/atlas-minero-energetico-colombia) | v0.1 |
| Atlas de Navegación Ambiental de Colombia | ANAC | Ambiental | [atlas-ambiental-colombia](https://github.com/Nicolas9714/atlas-ambiental-colombia) | v0.1 |

## Entidades por atlas

### ANMEC — 12 entidades

| Skill | Entidad | Rol principal |
| --- | --- | --- |
| `navegar-minenergia` | MinEnergía | Política energética nacional |
| `navegar-upme` | UPME | Planeación minero energética |
| `navegar-creg` | CREG | Regulación de energía y gas |
| `navegar-anh` | ANH | Hidrocarburos |
| `navegar-anm` | ANM | Titulación minera |
| `navegar-sgc` | SGC | Conocimiento geocientífico |
| `navegar-xm` | XM | Operación del sistema eléctrico y mercado |
| `navegar-ecopetrol` | Ecopetrol | Empresa nacional de hidrocarburos |
| `navegar-ipse` | IPSE | Energización de zonas no interconectadas |
| `navegar-fenoge` | FENOGE | Fondo de energías no convencionales |
| `navegar-superservicios` | Superservicios | Vigilancia de servicios públicos |
| `navegar-bec` | BEC | Bolsa de energía de Colombia |

### ANAC — 7 entidades

| Skill | Entidad | Rol principal |
| --- | --- | --- |
| `navegar-minambiente` | MinAmbiente | Política ambiental nacional |
| `navegar-anla` | ANLA | Licenciamiento ambiental |
| `navegar-ideam` | IDEAM | Hidrología, meteorología y estudios ambientales |
| `navegar-iavh` | IAvH | Investigación en biodiversidad |
| `navegar-invemar` | INVEMAR | Investigación marina y costera |
| `navegar-pnn` | Parques Nacionales Naturales | Áreas protegidas |
| `navegar-ungrd` | UNGRD | Gestión del riesgo de desastres |

## Fronteras temáticas

Temas que cruzan atlas, con las entidades de cada lado. Punto de partida para el enrutamiento de `atlas-orquestador-colombia`.

| Frontera | Lado ANMEC | Lado ANAC |
| --- | --- | --- |
| Licenciamiento y restricciones ambientales de proyectos mineros | ANM (títulos y solicitudes), SGC (potencial geológico) | ANLA (regionalización, geovisor), MinAmbiente (páramos, áreas protegidas) |
| Obligaciones ambientales e impacto hídrico de hidrocarburos | ANH (mapa de tierras, normativa sectorial) | ANLA (licencias y seguimiento), IDEAM (series hidrométricas), MinAmbiente (recurso hídrico) |
| Licenciamiento ambiental de FNCER | UPME (Plan 6GW+, planes de expansión), XM (generación por fuente) | ANLA (Geovisor Público, Eureka) |
| Línea base hidrometeorológica de proyectos energéticos | UPME, ANH (planeación y contratos) | IDEAM (DHIME, SIRH) |
| Gestión del riesgo en infraestructura minero energética | ANM, SGC (amenaza geológica en zonas mineras) | UNGRD (geovisores de amenaza), IDEAM (alertas) |

## Cómo registrar un atlas nuevo

1. El atlas cumple la parte normativa de [`estandar/especificacion.md`](estandar/especificacion.md) y declara la versión que cumple.
2. Pull request a este archivo: fila en la tabla de atlas registrados, tabla de entidades y las fronteras temáticas nuevas que introduce.
3. El mismo pull request agrega la tarjeta del atlas al banner del `README.md` (logo en `assets/` + sigla enlazada) y su fila en la tabla de atlas del README.
