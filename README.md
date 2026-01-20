# K3s Cluster Orchestration with Terraform & Multipass

This project demonstrates how to build a lightweight, local Kubernetes (K3s) cluster using **Terraform** and **Multipass**. The core focus is on automating the dynamic join process between master and worker nodes using the Terraform `templatefile` function.

## 🚀 Project Highlights
* **Automated Provisioning**: Spins up Ubuntu VMs using Multipass via Terraform.
* **Dynamic Join Process**: Uses `templatefile` to inject the Master's dynamic IP into the Worker's setup script.
* **Lightweight K8s**: Deploys K3s (1 Master, 1 Worker) for local development and lab environments.
* **Infrastructure as Code**: Managed entirely through Terraform for easy `apply` and `destroy` cycles.

## 📖 Detailed Tutorial
For a step-by-step guide on how this project was built and the technical logic behind the `templatefile` implementation, check out my detailed article on Medium:

👉 **[Building a Dynamic K3s Cluster on Medium](https://medium.com/@ysnhasturk)**

## 🛠️ Quick Start
1. Ensure you have **Multipass** and **Terraform** installed.
2. Clone this repository.
3. Run `terraform init`.
4. Run `terraform apply -auto-approve`.

---
*Created by [yasindevops](https://github.com/yasindevops)*
