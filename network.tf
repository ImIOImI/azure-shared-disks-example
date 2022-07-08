resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = [local.cidr-vnet]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [local.cidr-subnet]
}
