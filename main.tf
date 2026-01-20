terraform {
  required_providers {
    multipass = {
      source  = "larstobi/multipass"
      version = "~> 1.0"
    }
  }
}

provider "multipass" {}

# Provision the Master Node
resource "multipass_instance" "master" {
  name           = "k8s-master"
  cpus           = var.node_configs["k8s-master"].cpus
  memory         = var.node_configs["k8s-master"].memory
  disk           = var.node_configs["k8s-master"].disk
  cloudinit_file = "master_setup.yaml"
}

# Generate Worker's cloud-init file with Master's dynamic IP
resource "local_file" "worker_cloudinit_rendered" {
  content = templatefile("${path.module}/worker_setup.tftpl", {
    master_ip  = multipass_instance.master.ipv4
    join_token = var.k3s_token
  })
  filename = "${path.module}/worker_setup_rendered.yaml"
}

# Provision the Worker Node
resource "multipass_instance" "worker" {
  depends_on     = [multipass_instance.master, local_file.worker_cloudinit_rendered]
  name           = "k8s-worker"
  cpus           = var.node_configs["k8s-worker"].cpus
  memory         = var.node_configs["k8s-worker"].memory
  disk           = var.node_configs["k8s-worker"].disk
  cloudinit_file = local_file.worker_cloudinit_rendered.filename
}

output "master_ip" { value = multipass_instance.master.ipv4 }
output "worker_ip" { value = multipass_instance.worker.ipv4 }