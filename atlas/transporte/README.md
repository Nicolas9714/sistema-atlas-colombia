# Atlas Transporte — en construcción

Este espacio alojará las skills de las entidades del sector transporte: las que fijan la política, estructuran y supervisan la infraestructura vial, férrea, portuaria y aeroportuaria, operan la aviación civil, vigilan la prestación del servicio y gobiernan la seguridad vial.

Actualmente contiene seis marcadores, todavía sin contenido normativo N1:

| Skill | Entidad | Rol |
|---|---|---|
| `navegar-mintransporte` | Ministerio de Transporte | Política y regulación del sector transporte |
| `navegar-ani` | Agencia Nacional de Infraestructura (ANI) | Concesiones de infraestructura de transporte |
| `navegar-invias` | Instituto Nacional de Vías (INVÍAS) | Red vial nacional no concesionada |
| `navegar-aerocivil` | Aeronáutica Civil (Aerocivil) | Aviación civil y espacio aéreo |
| `navegar-supertransporte` | Superintendencia de Transporte | Vigilancia de la prestación del servicio de transporte |
| `navegar-ansv` | Agencia Nacional de Seguridad Vial (ANSV) | Seguridad vial y siniestralidad |

El atlas aún no está registrado ni se incluye en los instaladores porque no tiene orquestadora y sus entidades no cuentan con `SKILL.md`, `mapa-web.md` y `fuentes-prioritarias.md`.

Para pasar a estado conforme deberá:

1. Poblar los tres archivos N1 de cada entidad.
2. Crear `skills/atlas-orquestador-transporte/SKILL.md`.
3. Cumplir N1–N5 y autocontención según la [especificación](../../estandar/especificacion.md).
4. Incorporarse al [registro](../../registro.md) y a los instaladores.
