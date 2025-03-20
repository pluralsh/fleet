locals {
  range_name = var.allocated_range_name == "" ? "${var.cluster}-managed-services" : var.allocated_range_name
  # db_created = var.create_db ? module.pg.0.google_sql_user.default[0] : {}
  network = "${var.fleet}-${var.cluster}-network"
  subnetwork = "${var.fleet}-${var.cluster}-subnetwork"
  installable = var.enable_stacks ? module.console-workload-identity[0].k8s_service_account_name : "installable"
  split_vsn = [ for i in split(".", var.next_kubernetes_version): tonumber(i) ]
  vsn_even = ((tonumber(local.split_vsn[0]) * 100 + tonumber(local.split_vsn[1])) % 2) == 0
  active_node_group = local.vsn_even ? "blue" : "green"
  drain_node_group = local.vsn_even ? "green" : "blue"
}