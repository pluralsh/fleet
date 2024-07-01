data "google_client_config" "default" {}

data "plural_project" "default" {
  name = "default"
}

resource "plural_cluster" "this" {
    handle = var.cluster
    name   = var.cluster
    tags   = {
      fleet = var.fleet
      tier = var.tier
    }

    project_id = data.plural_project.default.id

    kubeconfig = {
      host = "https://${module.gke.endpoint}"
      cluster_ca_certificate = base64decode(module.gke.ca_certificate)
      token = data.google_client_config.default.access_token
    }

    depends_on = [ module.gcp-network ]
}