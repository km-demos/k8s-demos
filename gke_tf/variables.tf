variable "project" {
  type = string
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "zone" {
  type = string
  default = "us-central1-b"
}

variable "cluster_name" {
  type = string
  default = "demo-cluster"
}
