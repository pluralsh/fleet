variable "node_pools_taints" {
  type = map(list(object({ key = string, value = string, effect = string })))
  default = { 
    "{{ context.active }}" = [],
    "{{ context.drain }}" = [{key = "platform.plural.sh/pending", value="upgrade", effect="NoSchedule"}]
  }
}