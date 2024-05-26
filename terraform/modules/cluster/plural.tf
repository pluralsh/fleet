data "google_client_config" "default" {}

resource "plural_cluster" "this" {
    handle   = var.cluster_name
    name     = var.cluster_name

    kubeconfig = {
      host = module.gke.cluster.endpoint
      cluster_ca_certificate = base64decode(module.gke.cluster.ca_certificate)
      token = data.google_client_config.default.access_token
    }
}