locals {
  node_pool_add = {
    (local.active_node_group) = {version = var.next_kubernetes_version, auto_upgrade = false, min_count = 1},
    (local.drain_node_group) = {version = var.kubernetes_version, auto_upgrade = false, min_count = 0}
  }

  full_node_pools = {for k, v in var.node_pools: k => merge(v, lookup(local.node_pool_add, k))}
}

module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "~> 35.0"

  kubernetes_version     = var.next_kubernetes_version
  project_id             = var.project_id
  name                   = var.cluster
  regional               = true
  grant_registry_access  = true
  region                 = var.region
  network                = module.gcp-network.network_name
  subnetwork             = module.gcp-network.subnets_names[0]
  ip_range_pods          = var.ip_range_pods_name
  ip_range_services      = var.ip_range_services_name
  create_service_account = true
  deletion_protection    = false
  node_pools             = [for k, v in local.full_node_pools: merge(v, {name = k})]
  node_pools_taints      = merge(var.node_pools_taints, {
    (local.active_node_group) = [],
    (local.drain_node_group) = [{key = "platform.plural.sh/pending", value="upgrade", effect="NO_SCHEDULE"}]
  })
  node_pools_labels      = var.node_pools_labels
  node_pools_tags        = var.node_pools_tags

  datapath_provider = "ADVANCED_DATAPATH"

  release_channel = "UNSPECIFIED"

  depends_on = [
    google_project_service.gcr,
    google_project_service.container,
    google_project_service.iam,
    google_project_service.storage,
    google_project_service.dns,
    # local.db_created,
  ]
}