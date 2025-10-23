resource "google_artifact_registry_repository" "my-repo" {
  location      = var.location
  repository_id = "monitoring"
  description   = "docker repository for monitoring"
  format        = "DOCKER"
  project       = var.project_id

  docker_config {
    immutable_tags = true
  }
}
