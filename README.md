# 🚀 Terraform AKS Cluster Deployment on Azure

This project provisions an Azure Kubernetes Service (AKS) cluster using Terraform. It includes:

- Azure Resource Group
- Virtual Network and Subnet
- AKS Cluster with a default node pool
- SSH key configuration for node access

---

## 🛠️ Prerequisites

- Azure CLI: [Install](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- Terraform CLI: [Install](https://developer.hashicorp.com/terraform/downloads)
- SSH key (public) ready to use

## 🧪 Steps to Deploy AKS using Terraform

### 1️⃣ Authenticate to Azure
```bash
az login  --use-device-code
```



### 2️⃣ Update your SSH key
```hcl
variable "ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD..."  # Replace with your real SSH key
}
```


### 3️⃣ Initialize Terraform
```bash
terraform init
```

### 4️⃣ Preview the Terraform execution plan
```bash
terraform plan
```

### 5️⃣ Apply the Terraform plan
```bash
terraform apply
```

✅ Post-Deployment: Access Your AKS Cluster

After deployment, copy the ```kube_config``` output or run the following to configure kubectl:
```bash
az aks get-credentials --resource-group devops17-rg --name devops17-aks
```
```bash
kubectl get nodes
```


 📌 Notes
Default node count: 3

VM size: Standard_D2s_v3

Azure region: East US (change in variables.tf)

Identity: SystemAssigned (can integrate with ACR or Azure RBAC later)

🧹 Cleanup
```bash
terraform destroy
```
