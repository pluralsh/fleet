resource "kubernetes_namespace" "plural" {
  metadata {
    name = "plrl-deploy-operator"
    labels = {
      "app.kubernetes.io/managed-by" = "plural"
    }
  }
}

module "console-workload-identity" {
  count               = var.enable_stacks ? 1 : 0
  source              = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  name                = "${var.cluster}-plrl-stacks"
  namespace           = "plrl-deploy-operator"
  project_id          = var.project_id
  use_existing_k8s_sa = false
  annotate_k8s_sa     = false
  k8s_sa_name         = "stacks"
  roles               = ["roles/owner", "roles/storage.admin"]

  depends_on = [ kubernetes_namespace.plural ]
}