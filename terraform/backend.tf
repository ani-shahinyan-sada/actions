terraform {
  backend "gcs" {
    bucket = "gh-actions-task-task-ani"
    prefix = "terraform/state"
  }
}
