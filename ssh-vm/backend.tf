###
terraform {
  backend "gcs" {
    bucket = "gh-actions-task-task-ani"
    prefix = "docker_build/state"
  }
}
