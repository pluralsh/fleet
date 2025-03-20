data "plural_project" "fleet" {
  name = var.fleet
}

resource "time_sleep" "wait_30_seconds" {
  create_duration = "30s"

  depends_on = [module.gke.endpoint, local.installable]
}

resource "plural_cluster" "this" {
    handle = var.cluster
    name   = var.cluster
    tags   = {
      fleet = var.fleet
      tier = var.tier
    }

    project_id = data.plural_project.fleet.id

    metadata = jsonencode({
      master_version = var.next_kubernetes_version
      dns_zone = "gcp.plural.sh"
      iam = {
        external_dns = module.externaldns_workload_identity.gcp_service_account_email
      }
    })

    kubeconfig = {
      host = "https://${module.gke.endpoint}"
      cluster_ca_certificate = base64decode(module.gke.ca_certificate)
      token = data.google_client_config.default.access_token
    }

    depends_on = [ 
      module.gcp-network, 
      time_sleep.wait_30_seconds, 
      module.gke.node_pools_versions 
    ]
}