terraform {
  required_version = ">= 1.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_name = "modular-demo-vpc"
}

module "subnet" {
  source      = "./modules/subnet"
  subnet_name = "modular-demo-subnet"
  subnet_cidr = "10.20.1.0/24"
  region      = var.region
  vpc_id      = module.vpc.vpc_id
}

module "firewall" {
  source        = "./modules/firewall"
  firewall_name = "allow-ssh-modular"
  vpc_name      = module.vpc.vpc_name
}

module "vm" {
  source        = "./modules/vm"
  instance_name = "modular-demo-vm"
  machine_type  = "e2-micro"
  zone          = var.zone
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.subnet.subnet_id
}