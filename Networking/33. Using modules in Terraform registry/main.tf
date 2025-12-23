resource "azurerm_resource_group" "app-grp" {
    name="app-grp"
    location = "North Europe"
}

module "virtual-network" {
  source  = "aztfm/virtual-network/azurerm"
  version = "4.0.0"
  location ="North Europe"
  name = "app-network"
  resource_group_name=azurerm_resource_group.app-grp.name
  address_space=["10.0.0.0/16"]
  subnets = var.subnets
}