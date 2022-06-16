
variable "prefix" {
  description = "A prefix used for all resources"
}

variable "location" {
  description = "The Azure Region in which all resources should be provisioned"
}

variable "kubernetes_client_id" {
  description = "The Client ID for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "kubernetes_client_secret" {
  description = "The Client Secret for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "sku" {
  description = "The SKU of the AKS nodes"
  default     = "Standard_B2s"
}

variable "environment" {
  description = "The Environment of the AKS cluster"
  default     = "dev"
}

variable "vnetcidr" {
  description = "The CIDR of the VNet to use for the AKS cluster"
  default     = ["192.168.0.0/22"]
}

variable "vnetsubnet" {
  description = "The subnet(s) of the VNet to use for the AKS cluster"
  default     = ["192.168.0.0/24"]
}

variable "node_count" {
  description = "The number of nodes to use for the AKS cluster"
  default     = 1
}