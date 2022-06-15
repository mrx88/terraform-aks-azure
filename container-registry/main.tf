# ACR creation based on https://www.terraform.io/docs/providers/azurerm/r/container_registry.html
resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                = var.registryname
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.sku
  admin_enabled       = true
}

resource "azuread_application" "appname" {
  display_name = var.rgname
}

resource "azuread_service_principal" "appname" {
  application_id = azuread_application.appname.application_id
}

resource "azurerm_role_assignment" "appname" {
  role_definition_name = "Reader"
  scope                = azurerm_container_registry.acr.id
  principal_id         = azuread_service_principal.appname.id
}
