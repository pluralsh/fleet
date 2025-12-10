module "gcp-network" {
  source  = "terraform-google-modules/network/google"
  version = ">= 7.5"

  project_id   = var.project_id
  network_name = local.network

  subnets = [
    {
      subnet_name   = local.subnetwork
      subnet_ip     = var.subnet_cidr
      subnet_region = var.region
    },
  ]

  secondary_ranges = {
    (local.subnetwork) = [
      {
        range_name    = var.ip_range_pods_name
        ip_cidr_range = var.pods_cidr
      },
      {
        range_name    = var.ip_range_services_name
        ip_cidr_range = var.services_cidr
      },
    ]
  }

  # Explicitly use STANDARD BGP algorithm to avoid bgp_always_compare_med issues with LEGACY.
  network_bgp_policy = {
    best_path_selection = "STANDARD"
  }
}
