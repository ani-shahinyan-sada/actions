
resource "google_service_account" "default" {
  account_id   = "my-custom-sa"
  display_name = "Custom SA for VM Instance"
}


resource "google_project_iam_member" "artifact_registry_reader" {
  project = "build-project-476008"
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.default.email}"
}

resource "google_storage_bucket_iam_member" "vm_bucket_access" {
  bucket = "bucket-jan-akhpers"
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.default.email}"
}

# Give GitHub Actions SA permission to manage bucket IAM
resource "google_project_iam_member" "github_sa_storage_admin" {
  project = "build-project-476008"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.default.email}"
}

# Then this will work - give VM SA permission to read from bucket
resource "google_storage_bucket_iam_member" "vm_bucket_access" {
  bucket = "bucket-jan-akhpers"  # Replace with real bucket name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.default.email}"
}
