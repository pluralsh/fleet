module "dev" {
    source = "../modules/cluster"
    plural_token = local.plural_token

    cluster_name = var.dev_cluster
    network = "${var.fleet}-${var.dev_cluster}-network"
    subnetwork = "${var.fleet}-${var.dev_cluster}-subnetwork"
}

module "prod" {
    source = "../modules/cluster"
    plural_token = local.plural_token

    cluster_name = var.prod_cluster
    network = "${var.fleet}-${var.prod_cluster}-network"
    subnetwork = "${var.fleet}-${var.prod_cluster}-subnetwork"
}