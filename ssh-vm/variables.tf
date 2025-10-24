variable "location" {
  description = "the location of the cloud build operations"
  default     = ""
  type        = string
}

###

variable "project_id" {
  description = "the cloud build operations project"
  default     = ""
  type        = string
}

variable "fw_rules" {
  type = map(object({
    name          = string
    source_ranges = list(string)
    target_tags   = list(string)
    ports         = list(number)
  }))

}

variable "firewall_direction" {
  description = "ingress or egress"
  default     = ""
  type        = string
}

variable "firewall_priority" {
  description = "PRIORITY OF THE FIREWALL RULE (bigger number=smaller priority and vice versa)"
  default     = ""
  type        = string
}

variable "protocol" {
  type        = string
  description = "protocol for http traffic"
  default     = "tcp"
}

variable "metadata_config" {
  type        = string
  description = "what kind of metadata to include in the logs"
  default     = "INCLUDE_ALL_METADATA"
}

variable "tags" {
  type    = list(string)
  default = ["foo", "bar"]

}

variable "network_name" {
  description = "The name of the network being created"
  type        = string
}

variable "shared_vpc_host" {
  type        = bool
  description = "Makes this project a Shared VPC host if 'true' (default 'false')"
  default     = false
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  default     = false
}
