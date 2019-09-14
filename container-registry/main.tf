# ACR creation based on https://www.terraform.io/docs/providers/azurerm/r/container_registry.html
resource "azurerm_resource_group" "rg" {
  name     = "${var.rgname}"
  location = "${var.location}"
}


resource "azurerm_container_registry" "acr" {
  name                = "${var.registryname}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  location            = "${azurerm_resource_group.rg.location}"
  sku                 = "Basic"
  admin_enabled       = true
}

# Create Service Principal
module "service-principal" {
  source  = "innovationnorway/service-principal/azuread"
  version = "1.0.4"
  name    = "${var.sp_name}"
  years   = 2
}

# TODO: role assign to SP automatically for reading ACR,  use terraform resources (azurerm_role_assignment/azurerm_role_definition)
# Azure CLI command:
# az role assignment create --assignee <ID> --scope /subscriptions/<subsciption id>/resourceGroups/acr-dev/providers/Microsoft.ContainerRegistry/registries/acrdev88registry --role Reader