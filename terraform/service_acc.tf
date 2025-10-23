resource "google_service_account" "service_account" {
  account_id   = "sa-for-workflow"
  display_name = "Service Account for Workflows"
  project      = var.project_id
}

data "google_service_account" "object_viewer" {
  project    = var.project_id
  account_id = "sa-for-workflow"
}

resource "google_service_account_key" "example_key" {
  service_account_id = google_service_account.service_account.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

output "service_account_private_key" {
  value     = google_service_account_key.example_key.private_key
  sensitive = true
}

# To decode and save the key locally
resource "local_file" "service_account_key" {
  content  = base64decode(google_service_account_key.example_key.private_key)
  filename = "${path.module}/service-account-key.json"
}
