# README

## Documentación de Pruebas - API Motosmart

Para probar la aplicación y acceder a los endpoints, sigue los siguientes pasos:

1. Configuración de la Base de Datos:
   - Antes de comenzar, asegúrate de tener una base de datos PostgreSQL configurada y lista para usar.
   - Si aún no has configurado la base de datos, sigue los siguientes pasos:

     - Abre una terminal y navega hasta el directorio raíz del proyecto.
     - Ejecuta el siguiente comando para crear la base de datos:

       ```shell
       rails db:create
       ```

     - A continuación, ejecuta las migraciones para crear las tablas en la base de datos:

       ```shell
       rails db:migrate
       ```

     - Finalmente, carga los datos de ejemplo en la base de datos ejecutando los seeds:

       ```shell
       rails db:seed
       ```

2. Autenticación de Usuarios:
   - La autenticación de usuarios se realiza utilizando tokens JWT (JSON Web Tokens) sin el uso de gemas específicas de autenticación.
   - La autenticación se basa en los siguientes controladores:

     - `app/controllers/api/v1/base_controller.rb`
     - `app/controllers/api/v1/sessions_controller.rb`

3. Crear Usuarios:
   - Para crear un usuario, envía una solicitud POST a `/api/v1/users`.
   - Proporciona los detalles del usuario en el cuerpo de la solicitud en formato JSON.
   - El controlador de usuarios (`app/controllers/api/v1/users_controller.rb`) se encarga de crear el usuario y almacenarlo en la base de datos.

4. Obtener Token de Autenticación:
   - Para obtener un token de autenticación, envía una solicitud POST a `/api/v1/sign_in`.
   - El tiempo de vida del token es de 1 hora, pasada la hora ha expirado y si se usa el mensaje que retornará es `"error": "No autorizado"`
   - En el cuerpo de la solicitud, proporciona la dirección de correo electrónico del usuario y su contraseña en formato JSON.
   - El controlador de sesiones (`app/controllers/api/v1/sessions_controller.rb`) valida las credenciales del usuario.
   - Si las credenciales son válidas, se genera un token de autenticación y se devuelve en la respuesta.

5. Usar el Token de Autenticación:
   - Para acceder a los endpoints protegidos, agrega el token de autenticación en el encabezado de la solicitud.
   - Utiliza el encabezado `Authorization` con el valor `Bearer <token>`.
   - Asegúrate de reemplazar `<token>` con el token de autenticación que obtuviste al iniciar sesión.

Toda la documentación de los endpoints se encuentra aquí [Documentación API Motosmart](https://documenter.getpostman.com/view/3840932/2s93m1aQSe) para mayor detalle.

# 🚀

## Especificaciones Técnicas

- Ruby version: 3.2.0
- Version de Rails: 7.0.4.3
- Base de datos: Postgres
