# terraform.tfvars

gcp_project           = "study-project-414406"
gke_cluster_type      = "zonal"
gcp_region            = "us-central1"
gcp_region_zone       = "us-central1-a"
gke_version_prefix    = "1.18."
gke_cluster_cidr      = "10.0.0.0/24"
gcp_preemptible_nodes = true
machine_type          = "g1-small"
disk_size_gb          = 20
