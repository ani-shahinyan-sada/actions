fw_rules = {
  http = {
    name          = "allow-http"
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["http-server"]
    ports         = [80]
  },
  ssh = {
    name          = "allow-ssh"
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["ssh"]
    ports         = [22]
  }
}

firewall_direction = "INGRESS"
firewall_priority  = 1000
protocol           = "tcp"
metadata_config    = "INCLUDE_ALL_METADATA"

tags                    = ["http-server", "ssh"]
network_name            = "ssh-docker-vm"
shared_vpc_host         = false
auto_create_subnetworks = true

location   = "us-central1"
project_id = "build-project-476008"

