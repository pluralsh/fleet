terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.20.1" 
    }
    plural = {
      source = "pluralsh/plural"
      version = ">= 0.2.0"
    }
  }
}

provider "plural" {
  use_cli = true
}

provider "linode" { }