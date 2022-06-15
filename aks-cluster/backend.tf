terraform {
  /*   backend "azurerm" {
    resource_group_name   = "dev-storages"
    storage_account_name  = "tfstatesfordev"
    container_name        = "tfstates"
    key                   = "aks-dev.terraform.tfstate"
  } */
  required_providers {
    azurerm = {
      version = "~> 2.99.0"
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {

  features {
  }
}