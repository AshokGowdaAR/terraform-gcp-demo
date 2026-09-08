variable "project_id" {
  type = string
}

variable "vpc_name" {
  type    = string
  default = "demo-jenkins-vpc"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "region" {
  type    = string
  default = "us-central1"
}
