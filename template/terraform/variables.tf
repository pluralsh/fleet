variable "dev_cluster" {
  type = string 
  default = "{{ context.devCluster }}"
}

variable "prod_cluster" {
  type = string
  default = "{{ context.prodCluster }}"
}

variable "fleet" {
  type = string
  default = "{{ context.fleetName }}"
}