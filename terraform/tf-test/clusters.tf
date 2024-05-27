module "dev" {
  source = "../modules/cluster"
  tags = {
    fleet = var.fleet
    tier = "dev"
  }

  cluster_name = var.dev_cluster
  network = "${var.fleet}-${var.dev_cluster}-network"
  subnetwork = "${var.fleet}-${var.dev_cluster}-subnetwork"
}

module "prod" {
  source = "../modules/cluster"
  tags = {
    fleet = var.fleet
    tier = "prod"
  }

  cluster_name = var.prod_cluster
  network = "${var.fleet}-${var.prod_cluster}-network"
  subnetwork = "${var.fleet}-${var.prod_cluster}-subnetwork"
}