variable "vm_name" {}

variable "machine_type" {}

variable "zone" {}

variable "network_id" {}

variable "subnet_id" {}

variable "static_ip" {}

variable "service_account_email" {
  description = "Email of the service account attached to the VM."
  type        = string
}