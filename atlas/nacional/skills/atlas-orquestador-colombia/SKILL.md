---
name: atlas-orquestador-colombia
description: "Nodo nacional del Sistema Atlas Colombia: articula los Atlas de Navegación registrados, identifica conexiones entre sectores y coordina recorridos y consultas interatlas."
---

# Sistema Atlas Colombia: Skill Orquestadora Nacional

Esta skill articula los Atlas de Navegación registrados. Sus unidades son atlas completos: reconoce los ámbitos de información que intervienen en un asunto, localiza dónde vive cada parte y coordina el recorrido entre ellos.

Cada atlas conserva su ámbito, su orquestadora y sus skills especializadas. El nodo nacional conecta esos ámbitos sin centralizarlos ni reemplazarlos: la información específica y la autoridad sobre cada fuente permanecen en las skills de entidad.

El instalador agrega esta skill cuando se instalan dos o más atlas. Cada atlas también funciona de manera independiente.

## Atlas registrados y disponibles

| Atlas | Sector | Entidades | Orquestadora |
| --- | --- | --- | --- |
| Atlas de Navegación Minero Energético de Colombia | Minero energético | 12: MinEnergía, UPME, CREG, ANH, ANM, SGC, XM, Ecopetrol, IPSE, FENOGE, Superservicios, BEC | `atlas-orquestador-minero-energetico` |
| Atlas de Navegación Ambiental de Colombia | Ambiental | 7: MinAmbiente, ANLA, IDEAM, IAvH, INVEMAR, PNN, UNGRD | `atlas-orquestador-ambiental` |

La tabla incluye únicamente atlas registrados y operativos. Los atlas en construcción se incorporan cuando cumplen el estándar, publican su orquestadora y entran en el registro.

## Conexiones interatlas

Buena parte de la información pública adquiere sentido en relación con información que vive fuera de su sector. Un territorio, un proyecto, una infraestructura o un recurso pueden reunir datos ambientales, energéticos, territoriales, económicos o de transporte, aunque cada componente permanezca bajo la competencia de la entidad que lo publica.

El nodo nacional hace explícitas esas conexiones: reconoce qué ámbitos intervienen, dónde se encuentra cada parte y qué recorrido permite llegar hasta ella. Las conexiones existen en la arquitectura del Sistema antes de que una consulta las active; una pregunta permite recorrerlas, pero no las crea ni delimita su alcance.

## Cómo opera el nodo nacional

1. **Reconocer el asunto y sus ámbitos**: identificar el ámbito principal y los sectores relacionados.
2. **Localizar la información**: determinar en qué atlas y entidades vive cada parte pertinente.
3. **Conectar los tramos**: establecer un recorrido entre los atlas que intervienen, sin forzar todo el asunto dentro de un único sector.
4. **Recorrer cada atlas**: entrar por su orquestadora y continuar con las skills de entidad correspondientes.
5. **Integrar los resultados**: conservar la procedencia, el contexto y la competencia de cada fuente.
6. **Declarar los límites**: señalar qué parte no puede recorrerse cuando un atlas no está instalado o el Sistema todavía no cubre ese ámbito.

## Consultas interatlas

Las consultas son una de las formas de activar las conexiones interatlas. Cuando una pregunta se resuelve dentro de un solo sector, se conduce al atlas correspondiente. Cuando requiere información repartida entre varios ámbitos, el nodo nacional identifica el cruce y coordina los tramos de la respuesta.

Ante una consulta concreta, presume el cruce y lo verifica contra la tabla de atlas.

Indicios de cruce:

- La consulta sitúa el asunto en un lugar o en un proyecto determinado.
- Pide el estado de algo junto con su marco regulatorio.
- Combina datos de operación con datos de control o seguimiento.
- Nombra una entidad de un sector y un objeto de competencia de otro.

La lista orienta el juicio y admite casos nuevos. [`examples/consultas-de-ejemplo.md`](../../../../examples/consultas-de-ejemplo.md) reúne consultas con su ruta esperada: calibra el criterio y muestra recorridos posibles, sin convertirlos en un catálogo cerrado de conexiones.

## Cobertura parcial y límites

- Si el atlas pertinente está registrado e instalado, recorrerlo mediante su orquestadora.
- Si está registrado pero no instalado, resolver con los atlas disponibles e indicar cuál hace falta para continuar.
- Si ningún atlas registrado cubre una parte del asunto, explicitar el límite del Sistema y señalar dónde debería continuar la investigación cuando pueda identificarse, sin presentar como disponible una skill que todavía no existe.

## Registro

La lista autorizada de atlas y entidades vive en [`registro.md`](../../../../registro.md). La tabla de arriba es su espejo compacto; ante cualquier divergencia, manda el registro.
