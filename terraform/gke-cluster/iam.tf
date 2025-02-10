module "console-workload-identity" {
  count               = var.enable_stacks ? 1 : 0
  source              = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  name                = "${var.cluster}-plrl-stacks"
  namespace           = "plrl-deploy-operator"
  project_id          = var.project_id
  use_existing_k8s_sa = true
  annotate_k8s_sa     = false
  k8s_sa_name         = "stacks"
  roles               = ["roles/owner", "roles/storage.admin"]
}

module "externaldns_workload_identity" {
  source              = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  name                = "${var.cluster}-externaldns"
  namespace           = "external-dns"
  project_id          = var.project_id
  use_existing_k8s_sa = true
  annotate_k8s_sa     = false
  k8s_sa_name         = "external-dns"
  roles               = ["roles/dns.admin"]

  depends_on = [google_project_service.iam]
}