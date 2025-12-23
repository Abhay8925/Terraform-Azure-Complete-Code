resource "azurerm_virtual_network" "virtual_network" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_address_prefix]
}

resource "azurerm_subnet" "network_subnets" {
  count=var.vnet_subnet_count
  name                 = "subnet${count.index}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [cidrsubnet(var.vnet_address_prefix,8,count.index)]
}