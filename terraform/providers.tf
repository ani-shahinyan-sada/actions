terraform {
  required_providers {
    google = {}
  }
}

provider "google" {
  project = var.project_id
  region  = var.location
}
