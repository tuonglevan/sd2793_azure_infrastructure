data "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  resource_group_name = var.resource_group_name

  depends_on = [
    var.aks_cluster_name
  ]
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = data.azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = true
  public_network_access_enabled = true
}