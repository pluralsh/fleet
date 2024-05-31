module "cluster" {
  source = "../modules/gke"
  tags = {
    fleet = var.fleet
    tier = var.tier
  }

  cluster_name = var.cluster
  network = "${var.fleet}-${var.cluster}-network"
  subnetwork = "${var.fleet}-${var.cluster}-subnetwork"
}