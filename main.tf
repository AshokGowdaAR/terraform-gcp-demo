#Network Module Call

module "network" {
  source = "./modules/network"

  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
  region      = var.region
}

#Firewall Module Call

module "firewall" {
  source = "./modules/firewall"

  firewall_name = var.firewall_name
  network_id    = module.network.network_id
}

#NAT Module Call

module "nat" {
  source = "./modules/nat"

  router_name = "nat-router-${var.region}"
  nat_name    = "nat-config-${var.region}"
  region      = var.region
  network_id  = module.network.network_id
}

#Static IP Module Call

module "static_ip" {
  source = "./modules/static-ip"

  ip_name = "${var.vm_instance_name}-ip"
  region  = var.region
}

#VM Module Call

module "vm" {
  source = "./modules/vm"

  vm_name      = var.vm_instance_name
  machine_type = var.machine_type
  zone         = var.zone

  network_id = module.network.network_id
  subnet_id  = module.network.subnet_id
  static_ip  = module.static_ip.ip_address
  # Passing the service account email to the VM module
  service_account_email = module.vm_service_account.email
}

#Storage Bucket Module Call

module "app_storage_bucket" {
  source = "./modules/storage-bucket"

  project_id    = var.project_id
  bucket_name   = "${var.project_id}-my-app-data" # Globally unique.
  location      = var.region
  storage_class = "STANDARD"
}

#Service Account Module Call

module "vm_service_account" {
  source = "./modules/service-account"

  project_id   = var.project_id
  account_id   = "my-app-vm-sa" # Unique ID for the SA
  display_name = "Service Account for Application VM"
  # project_roles = ["roles/logging.logWriter"] # Example: if the VM needs to write logs
}

resource "google_storage_bucket_iam_member" "bucket_object_viewer" {
  bucket = module.app_storage_bucket.bucket_name               # Reference the bucket created by the module
  role   = "roles/storage.objectViewer"                        # Read-only access to objects
  member = "serviceAccount:${module.vm_service_account.email}" # Use the output from the SA module
}