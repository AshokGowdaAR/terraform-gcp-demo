module "vpc" {
  source      = "./modules/vpc"
  project_id  = var.project_id
  region      = var.region
  vpc_name    = "demo-jenkins-vpc"
  subnet_cidr = "10.0.1.0/24"
}