variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "bucket_name" {
  description = "The globally unique name of the Cloud Storage bucket."
  type        = string
}

variable "location" {
  description = "The location (region or multi-region) for the bucket."
  type        = string
}

variable "storage_class" {
  description = "The storage class for the bucket (STANDARD, NEARLINE, COLDLINE, ARCHIVE)."
  type        = string
  default     = "STANDARD"
}