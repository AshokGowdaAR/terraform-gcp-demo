resource "google_compute_firewall" "firewall" {
  name          = var.firewall_name
  network       = var.network_id
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}