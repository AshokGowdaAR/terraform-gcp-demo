resource "google_service_account" "default" {
  account_id   = var.account_id
  display_name = var.display_name
  project      = var.project_id
}

# Optional: Grant project-level roles to this service account
# This is useful if the SA needs broad permissions across the project,
# but generally, resource-specific IAM is preferred.
resource "google_project_iam_member" "project_roles" {
  for_each = toset(var.project_roles) # Iterate over a list of roles
  project  = var.project_id
  role     = each.value
  member   = "serviceAccount:${google_service_account.default.email}"
}