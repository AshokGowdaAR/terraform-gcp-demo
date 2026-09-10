variable "instance_name" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "e2-micro"
}

variable "zone" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}