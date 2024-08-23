resource "azurerm_resource_group" "k8s_rg" {
  name     = var.k8s_rg_name
  location = var.location
}