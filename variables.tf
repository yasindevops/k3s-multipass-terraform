variable "k3s_token" {
  description = "Shared secret for nodes to join the cluster"
  default     = "k8s-otomatik-sifre-2026"
}

variable "node_configs" {
  description = "Hardware configuration for master and worker nodes"
  type = map(object({
    cpus   = number
    memory = string
    disk   = string
  }))
  default = {
    "k8s-master" = { cpus = 2, memory = "2G", disk = "10G" }
    "k8s-worker" = { cpus = 2, memory = "2G", disk = "10G" }
  }
}