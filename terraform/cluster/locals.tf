locals {
  range_name = var.allocated_range_name == "" ? "${var.cluster_name}-managed-services" : var.allocated_range_name
  # db_created = var.create_db ? module.pg.0.google_sql_user.default[0] : {}
}