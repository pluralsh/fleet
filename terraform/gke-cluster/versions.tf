terraform {
  required_version = ">= 1.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.10"
    }
    plural = {
      source = "pluralsh/plural"
      version = ">= 0.2.9"
    }
    local = {
        source = "hashicorp/local"
    }
  }
}

provider "google" {
  region = "us-east-2"
}

provider "kubernetes" {
  host = "https://${module.gke.endpoint}"
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
  token = data.google_client_config.default.access_token
}

data "google_client_config" "default" {}

provider "plural" { }