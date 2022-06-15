output "registry_endpoint" {
  value = azurerm_container_registry.acr.login_server
}

output "admin_username" {
  value     = azurerm_container_registry.acr.admin_username
  sensitive = true
}

output "admin_password" {
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}
