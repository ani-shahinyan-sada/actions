# resource "google_service_account" "default" {
#   account_id   = "vm-service-acc"
#   display_name = "Custom SA for VM Instance"
#   project = var.project_id
# }

# resource "google_compute_instance" "default" {
#   name         = "my-instance"
#   machine_type = "n4-standard-2"
#   zone         = "${var.location}-a"
#   project = var.project_id

#   tags = ["foo", "bar"]
#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-11"
#       labels = {
#         my_label = "value"
#       }
#     }
#   }

#   network_interface {
#     network = "default"
#     access_config {
#     }
#   }

#   metadata_startup_script = "echo hi > /test.txt"
#   service_account {
#     email  = google_service_account.default.email
#     scopes = ["cloud-platform"]
#   }
# }
