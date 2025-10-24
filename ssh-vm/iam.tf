
resource "google_service_account" "default" {
  account_id   = "my-custom-sa"
  display_name = "Custom SA for VM Instance"
  depends_on   = [google_project_service.project]
}


resource "google_project_iam_member" "artifact_registry_reader" {
  project = "build-project-476008"
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.default.email}"
}

