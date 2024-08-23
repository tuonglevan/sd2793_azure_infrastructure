resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.aks_cluster_name}-dns"
  azure_policy_enabled = true


  default_node_pool {
	name       = "default"
	node_count = 2
	vm_size    = "Standard_DS2_v2"
	vnet_subnet_id = var.aks_subnet_id
  }

  network_profile {
	network_plugin	= "azure"
	dns_service_ip	= "10.10.10.10"
	service_cidr	= "10.10.0.0/16"
  }

  identity {
	type = "SystemAssigned"
  }

  depends_on = [
	var.acr_id,
  ]
}