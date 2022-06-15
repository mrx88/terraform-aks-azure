# terraform-aks-azure
Terraform code for provisioning managed Azure Container Registry (ACR) and Azure Kubernetes Service (AKS).

# Deployment

Terraform state is kept in Azure storage (backend.tf).

## Container Registry

Provision new ACR:
```
cd container-registry
terraform init
terraform plan
terraform apply
```

## Kubernetes Cluster


* Fill variables accordingly in .tfvars file or ENV

```
prefix                   = "dev"
location                 = "West Europe"
kubernetes_client_id     = "<sp client id>"
kubernetes_client_secret = "<sp pw>"
```

Provision new AKS cluster:
```
cd aks-cluster
terraform init
terraform plan
terraform apply
```
