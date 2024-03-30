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
  name     = "my-gke-cluster"                                                         
  location = var.gke_cluster_type == "regional" ? var.gcp_region : var.gcp_region_zone 
  remove_default_node_pool = true

  deletion_protection = false

  node_pool {
    name       = "default-pool"
    initial_node_count = 1

    autoscaling {
      min_node_count = 1
      max_node_count = 2
    }

    node_config {
      machine_type = "g1-small"
      disk_size_gb = 20
      preemptible  = var.gcp_preemptible_nodes 
      labels = {
        "cos" = "true" # для Ubuntu
      }
    }
  }


  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
}



