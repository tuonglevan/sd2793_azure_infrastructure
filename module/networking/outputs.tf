output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
output "aks_subnet_id" {
  value = azurerm_subnet.aks_subnet.id
}