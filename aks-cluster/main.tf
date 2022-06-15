# AKS cluster creation
# Based on https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html
resource "azurerm_resource_group" "kube" {
  name     = "${var.prefix}-k8s-resources"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "kube" {
  name                = "${var.prefix}-k8s"
  location            = azurerm_resource_group.kube.location
  resource_group_name = azurerm_resource_group.kube.name
  dns_prefix          = "${var.prefix}-k8s"

  default_node_pool {
    node_count = 1
    name            = "default"
    vm_size         = var.sku
  }

  service_principal {
    client_id     = var.kubernetes_client_id
    client_secret = var.kubernetes_client_secret
  }

  tags = {
    Environment = var.environment
  }

  depends_on = [
    azurerm_resource_group.kube
  ]
}
