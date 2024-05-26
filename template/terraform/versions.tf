terraform {
  required_version = ">= 1.0"

  backend "gcs" {
    bucket  = "plrl-fleet"
    prefix  = "terraform/{{ context.fleetName }}"
  }

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
      version = ">= 0.2.0"
    }
    local = {
        source = "hashicorp/local"
    }
  }
}

provider "google" {
  region = "us-east-2"
}

data "google_client_config" "default" {}

data "local_sensitive_file" "console" {
  filename = "${path.module}/../console.yaml"
}

locals {
    console_conf = yamldecode(data.local_sensitive_file.console).spec
    plural_token = local.console_conf.token
}

provider "plural" {
  console_url = local.console_conf.url
  access_token = local.console_conf.token
}