terraform {
  backend "gcs" {
    bucket = "my-project-jenkins-tfstate-bucket"
    prefix = "terraform/state"
  }
}
