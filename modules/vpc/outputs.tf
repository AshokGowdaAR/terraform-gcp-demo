output "network_id" { value = google_compute_network.vpc_network.id }
output "subnet_id" { value = google_compute_subnetwork.custom_subnet.id }