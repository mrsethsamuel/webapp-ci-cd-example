# Create a container registry

resource "google_artifact_registry_repository" "registry" {
  location      = var.region
  repository_id = "${var.project_id}-repo"
  description   = "example docker repository"
  format        = "DOCKER"
}