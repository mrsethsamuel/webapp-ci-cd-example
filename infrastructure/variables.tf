
variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}

variable "project_id" {
  description = "project id"
  default = "demo-project"
}

variable "region" {
  description = "region"
  default = "us-central1"
}

variable "machine_type" {
  description = "Machine type for nodepool"
  default     = "e2-standard-2"
}
