resource "google_storage_bucket" "main" {
  name          = var.bucket_name
  location      = var.location
  project       = var.project_id
  storage_class = var.storage_class # "STANDARD", "NEARLINE", "COLDLINE", "ARCHIVE"
  uniform_bucket_level_access = true # Recommended for security and simpler IAM

  # Optional: Enable versioning for data protection (can increase storage cost)
  # versioning {
  #   enabled = true
  # }

  # Optional: Lifecycle rules for cost optimization (e.g., move old objects to colder storage)
  # lifecycle_rule {
  #   action {
  #     type = "SetStorageClass"
  #     storage_class = "NEARLINE"
  #   }
  #   condition {
  #     age = 30 # Days
  #   }
  # }
}