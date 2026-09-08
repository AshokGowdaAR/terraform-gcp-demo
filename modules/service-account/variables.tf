variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "account_id" {
  description = "The ID of the service account (must be unique within the project)."
  type        = string
}

variable "display_name" {
  description = "A user-friendly name for the service account."
  type        = string
}

variable "project_roles" {
  description = "A list of project-level IAM roles to grant to this service account."
  type        = list(string)
  default     = [] # No project-level roles by default
}