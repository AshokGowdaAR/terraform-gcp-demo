output "email" {
  description = "The email address of the created service account."
  value       = google_service_account.default.email
}

output "id" {
  description = "The ID of the created service account."
  value       = google_service_account.default.id
}