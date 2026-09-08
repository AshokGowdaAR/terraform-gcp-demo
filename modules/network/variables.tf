# variable "vpc_name" {}
# variable "subnet_name" {}
# variable "subnet_cidr" {}
# variable "region" {}

variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnetwork"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "region" {
  description = "GCP Region for the subnet"
  type        = string
}