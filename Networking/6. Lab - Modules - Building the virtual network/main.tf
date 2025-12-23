

module "resource-group" {
    source = "./modules/general/resourcegroup"
    resource_group_name = var.resource_group_name
    location = var.location
}   

module "network" {
   source="./modules/networking/vnet"
   resource_group_name = var.resource_group_name
   location = var.location
   vnet_name = var.vnet_name
   vnet_address_prefix = var.vnet_address_prefix
   vnet_subnet_count = var.vnet_subnet_count
   depends_on = [ module.resource-group ]
}
