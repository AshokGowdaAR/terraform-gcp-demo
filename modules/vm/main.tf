resource "google_compute_instance" "vm" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = var.network_id
    subnetwork = var.subnet_id

    access_config {
      nat_ip = var.static_ip
    }
  }


  # Added this block to attach the service account to the VM
  service_account {
    email  = var.service_account_email # This will come from the root module
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only"] # Specific scope for storage read
    # For broader access, you could use ["cloud-platform"], but it's less secure.
    # If your VM needs to write to the bucket, change this to:
    # scopes = ["https://www.googleapis.com/auth/devstorage.read_write"]
  }
}