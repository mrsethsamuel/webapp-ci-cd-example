# GKE cluster

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  version                    = "~> 29.0"
  project_id                 = module.enabled_google_apis.project_id
  name                       = "${var.project_id}-gke"
  region                     = var.region
  zones                      = ["${var.region}-a"]
  initial_node_count         = 1
  network                    = google_compute_network.vpc.name
  subnetwork                 = google_compute_subnetwork.subnet.name
  ip_range_pods              = ""
  ip_range_services          = ""
  remove_default_node_pool   = true
  horizontal_pod_autoscaling = true
  deletion_protection        = false
  regional                   = false

  node_pools = [
    {
      name               = "${var.project_id}-gke-pool"
      machine_type       = var.machine_type
      min_count          = 1
      max_count          = 10
      local_ssd_count    = 0
      spot               = false
      disk_size_gb       = 10
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      logging_variant    = "DEFAULT"
      auto_repair        = true
      auto_upgrade       = true
      autoscaling        = true
      preemptible        = false
      initial_node_count = 1
    },
  ]

}

resource "kubernetes_namespace" "development" {
  metadata {
    name = "development"
  }

  depends_on = [module.gke.cluster_id]
}

resource "kubernetes_namespace" "staging" {
  metadata {
    name = "staging"
  }

  depends_on = [module.gke.cluster_id]
}

resource "kubernetes_namespace" "production" {
  metadata {
    name = "production"
  }

  depends_on = [module.gke.cluster_id]
}

