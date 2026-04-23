# Recurso para la Base de Datos PostgreSQL
resource "docker_container" "db" {
  name  = "bd-${terraform.workspace}"
  image = "postgres:latest"
  
  # Variables de entorno requeridas por la imagen de Postgres
  env = [
    "POSTGRES_PASSWORD=password123",
    "POSTGRES_DB=mi_base_de_datos"
  ]

  ports {
    internal = 5432 # Puerto estándar de PostgreSQL
    external = terraform.workspace == "dev" ? 4003 : 5003
  }
}