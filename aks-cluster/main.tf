# AKS cluster creation
# Based on https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html
resource "azurerm_resource_group" "kube" {
  name     = "${var.prefix}-k8s-resources"
  location = "${var.location}"
}

resource "azurerm_kubernetes_cluster" "kube" {
  name                = "${var.prefix}-k8s"
  location            = "${azurerm_resource_group.kube.location}"
  resource_group_name = "${azurerm_resource_group.kube.name}"
  dns_prefix          = "${var.prefix}-k8s"

  agent_pool_profile {
    name            = "default"
    count           = 1
    vm_size         = "Standard_B2s"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = "${var.kubernetes_client_id}"
    client_secret = "${var.kubernetes_client_secret}"
  }

  tags = {
    Environment = "dev"
  }

  depends_on = [
    "azurerm_resource_group.kube"
  ]
}
