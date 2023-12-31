variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "machine_type" {
  type = string
  default = "t2a-standard-8"
}

variable "min_node_count" {
  type = number
  default = 1
}

variable "max_node_count" {
  type = number
  default = 4
}