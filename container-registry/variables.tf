variable "rgname" {
  description = "Resource Group name for Azure Container Registry resources"
  default = "acr-dev"
}

variable "location" {
  description = "The Azure Region in which all resources should be provisioned for ACR"
  default = "West Europe"
}

variable "registryname" {
  description = "Azure Container Registry name"
  default = "acrdev88registry"
}

variable "sp_name" {
  description = "Service Principal name"
  default = "aks-cluster-dev"
}
