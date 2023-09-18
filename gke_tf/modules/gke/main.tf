# google_client_config and kubernetes provider must be explicitly specified like the following.
# Retrieve an access token as the Terraform runner
data "google_client_config" "provider" {}

data "google_compute_network" "default" {
  name = "default"
}

resource "google_container_cluster" "primary" {
  name = var.cluster_name
  location = var.zone
  remove_default_node_pool = true
  initial_node_count       = 1
  subnetwork = "default"

  release_channel {
    channel = "REGULAR"
  }
  resource_labels = {
    cluster-name = var.cluster_name
  }

  workload_identity_config {
    workload_pool = "${var.project}.svc.id.goog"
  }

  maintenance_policy {
    recurring_window {
      start_time = "2020-05-15T04:00:00Z"
      end_time = "2020-05-16T04:00:00Z"
      recurrence = "FREQ=WEEKLY;BYDAY=SA,SU"
    }
  }
  
  ip_allocation_policy {
    services_ipv4_cidr_block = ""
    cluster_ipv4_cidr_block = ""
  }

  networking_mode = "VPC_NATIVE"
}

resource "google_container_node_pool" "primary_nodes" {
  name = "main-node-pool"
  location = google_container_cluster.primary.location
  cluster = google_container_cluster.primary.name
  initial_node_count = 1

  autoscaling {
    max_node_count = var.max_node_count
    min_node_count = var.min_node_count
  }

  node_config {
    preemptible = false
    machine_type = var.machine_type
    disk_size_gb = 100

    metadata = {
      disable-legacy-endpoints = "true"
    }
    labels = {
      cluster-id = var.cluster_name
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
