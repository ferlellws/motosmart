# README

# Documentación de Pruebas - API Motosmart

Para probar la aplicación y acceder a los endpoints, sigue los siguientes pasos:

1. Crear Usuarios:
   - Envía una solicitud POST a `/api/v1/users` para crear usuarios.
   - Proporciona los detalles del usuario en el cuerpo de la solicitud en formato JSON.
   - Recibirás una respuesta con los detalles del usuario creado.

2. Obtener Token de Autenticación:
   - Envía una solicitud POST a `/api/v1/sign_in` para obtener el token de autenticación.
   - Proporciona la dirección de correo electrónico del usuario en el cuerpo de la solicitud en formato JSON.
   - Recibirás una respuesta con el token de autenticación.

3. Usar el Token de Autenticación:
   - Para acceder a otros endpoints, agrega el token de autenticación en el encabezado de la solicitud.
   - Utiliza el encabezado `Authorization` con el valor `Bearer <token>`.
   - Asegúrate de reemplazar `<token>` con el token de autenticación que obtuviste.

Toda la documentación de los endpoints se encuentra aquí https://documenter.getpostman.com/view/3840932/2s93m1aQSe para mayor detalle

¡Ahora estás listo para probar los otros endpoints de la API!


## Especificaciones Técnicas

- Ruby version: 3.2.0

- Version de Rails: 7.0.4.3

- Base de datos: Postgres
