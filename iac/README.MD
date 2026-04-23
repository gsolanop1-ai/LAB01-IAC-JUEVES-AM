Proyecto de Infraestructura como Código con Terraform y Docker
Este proyecto lo hice para automatizar la creación de contenedores usando Terraform. La idea es tener dos entornos separados (dev y qa) corriendo al mismo tiempo pero en puertos diferentes. La arquitectura tiene un Frontend con Nginx, un Backend con Node.js y una base de datos PostgreSQL.

Lo que usé
Terraform para toda la automatización.

Docker para manejar los contenedores.

PostgreSQL para la base de datos.

Nginx para el servidor web.

Node.js para la API del backend.

Requisitos
Tener instalado Terraform y Docker.

Tener Git para bajar el proyecto.

Pasos que seguí en la terminal
Lo primero es construir las imágenes de Docker para que Terraform las encuentre:

Para la web: cd src/web01 y luego docker build -t lab/web .

Para la api: cd src/api y luego docker build -t lab/api .

Después me fui a la carpeta de iac para empezar con Terraform:

cd iac

terraform init para bajar los plugins.

terraform validate para revisar que el código esté bien escrito.

Para desplegar en los dos entornos usé los Workspaces:

Para Desarrollo: terraform workspace select dev y luego terraform apply -auto-approve.

Para QA: terraform workspace select qa y luego terraform apply -auto-approve.

Si hacía cambios en el código y quería que se actualizaran los contenedores, usaba el comando taint:

terraform taint docker_container.web

terraform apply -auto-approve

Cómo entrar a las páginas
Una vez que Terraform termina, puedes probar los enlaces en el navegador:

Desarrollo (dev):

Frontend: http://localhost:4001

Backend: http://localhost:4002

Base de Datos: Puerto 4003 (este no abre en navegador, solo por consola).

Calidad (qa):

Frontend: http://localhost:5001

Backend: http://localhost:5002

Base de Datos: Puerto 5003.

Configuración de los puertos
Los puertos los definí en las variables de Terraform de esta forma:

api_port: dev (4002), qa (5002)

web_port: dev (4001), qa (5001)

bd_port: dev (4003), qa (5003)