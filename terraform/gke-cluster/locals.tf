locals {
  range_name = var.allocated_range_name == "" ? "${var.cluster}-managed-services" : var.allocated_range_name
  # db_created = var.create_db ? module.pg.0.google_sql_user.default[0] : {}
  network = "${var.fleet}-${var.cluster}-network"
  subnetwork = "${var.fleet}-${var.cluster}-subnetwork"
  installable = var.enable_stacks ? module.console-workload-identity.k8s_service_account_name : kubernetes_namespace.plural.metadata[0].uid
}