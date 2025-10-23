# data "google_iam_policy" "p4sa-secretAccessor" {
#   binding {
#     role = "roles/secretmanager.secretAccessor"
#     // Here, 123456789 is the Google Cloud project number for the project that contains the connection.
#     members = ["serviceAccount:service-123456789@gcp-sa-cloudbuild.iam.gserviceaccount.com"]
#   }
# }
