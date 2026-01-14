variable "cluster" {
  type = string
  default = "plural"
}

variable "enable_stacks" {
  type = bool
  default = false
}

variable "kubernetes_version" {
  type = string
  default = "1.29" # dev version
}

variable "next_kubernetes_version" {
  type = string
  default = "1.29" # dev version
}

variable "node_pools" {
  type = map(any)
  default = {
    blue = {
      min_count = 0,
      max_count = 20,
      machine_type = "e2-standard-2"
    }
    green = {
      min_count = 0,
      max_count = 20,
      machine_type = "e2-standard-2"
    }
  }
}

variable "node_pools_taints" {
  type = map(list(object({ key = string, value = string, effect = string })))
  default = { "all": [], "default-node-pool": [] }
}

variable "node_pools_labels" {
  type = map(map(string))
  default = { 
    "all": {}, 
    "default-node-pool": {}, 
    "blue": {"platform.plural.sh/bg": "blue"},
    "green": {"platform.plural.sh/bg": "green"},
  }
}

variable "node_pools_tags" {
  type = map(list(string))
  default = { "all": [], "default-node-pool": [] }
}

variable "project_id" {
  type = string
  default = "pluralsh-test-384515"
}

variable "region" {
  type = string
  description = "The region to host the cluster in"
  default     = "us-central1"
}

variable "subnet_cidr" {
  type = string
  default = "10.0.16.0/20"
}

variable "pods_cidr" {
  type = string
  default = "10.16.0.0/12"
}

variable "allocated_range_name" {
  type = string
  default = ""
}

variable "services_cidr" {
  type = string
  default = "10.1.0.0/20"
}

variable "ip_range_pods_name" {
  type = string
  description = "The secondary ip range to use for pods"
  default     = "ip-range-pods"
}

variable "ip_range_services_name" {
  type = string
  description = "The secondary ip range to use for services"
  default     = "ip-range-svc"
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "tier" {
  type = string
  default = "dev"
}

variable "fleet" {
  type = string
  default = "tf-test"
}
