# main.tf

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.47"
    }
  }
  required_version = ">= 0.13"
}

provider "google" {
  credentials = file("./keys/gcp-service-account.json")
  project     = var.gcp_project
}


resource "google_container_cluster" "primary" {
  name = "my-gke-cluster"

  location = var.gke_cluster_type == "regional" ? var.gcp_region : var.gcp_region_zone

  remove_default_node_pool = true
  initial_node_count       = 1

  deletion_protection = false

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name = "my-node-pool"

  location = var.gke_cluster_type == "regional" ? var.gcp_region : var.gcp_region_zone

  cluster            = google_container_cluster.primary.name
  initial_node_count = 1

  lifecycle {
    ignore_changes = [initial_node_count]
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = var.gcp_preemptible_nodes
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
  }
}



