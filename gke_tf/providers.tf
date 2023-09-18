terraform {
  backend "gcs" {
    bucket = "REPLACE_BUCKET"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 4.82"
    }
  }
}

provider "google" {
  project = var.project
  region = var.region
}
