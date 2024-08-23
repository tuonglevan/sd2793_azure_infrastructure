resource "azurerm_network_security_group" "app_nsg" {
  name                = "${var.vnet_name}-app-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
	name                       = "AllowHTTP"
	priority                   = 100
	direction                  = "Inbound"
	access                     = "Allow"
	protocol                   = "Tcp"
	source_port_range          = "*"
	destination_port_range     = "80"
	source_address_prefix      = "*"
	destination_address_prefix = "*"
  }

  security_rule {
	name                       = "AllowHTTPS"
	priority                   = 101
	direction                  = "Inbound"
	access                     = "Allow"
	protocol                   = "Tcp"
	source_port_range          = "*"
	destination_port_range     = "443"
	source_address_prefix      = "*"
	destination_address_prefix = "*"
  }
}