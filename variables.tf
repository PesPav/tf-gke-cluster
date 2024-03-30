# variables.tf

variable "gcp_project" {
  description = "ID проекта GCP"
}

variable "gke_cluster_type" {
  description = "Тип кластера GKE (zonal или regional)"
  default     = "zonal"
}

variable "gcp_region" {
  description = "Регион"
}

variable "gcp_region_zone" {
  description = "Зона в регионе"
}

variable "gke_version_prefix" {
  description = "Префикс версии Kubernetes (например, 1.18.)"
}

variable "gke_cluster_cidr" {
  description = "CIDR-диапазон"
}

variable "gcp_preemptible_nodes" {
  description = "Использовать ли Preemptible VMs для узлов кластера GKE"
  default     = true
}


