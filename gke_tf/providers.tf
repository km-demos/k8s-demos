terraform {
  backend "gcs" {
    bucket = "REPLACE_BUCKET"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 4.76"
    }
  }
}

provider "google" {
  project = var.project
  region = var.region
}
