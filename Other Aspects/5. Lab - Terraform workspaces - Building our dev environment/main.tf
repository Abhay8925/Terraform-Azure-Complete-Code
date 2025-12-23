

module "resource-group" {
    source = "./modules/general/resourcegroup"
    resource_group_name = "${terraform.workspace}-${var.resource_group_name}"
    location = var.location
}   


module "network" {
   source="./modules/networking/vnet"
   resource_group_name = "${terraform.workspace}-${var.resource_group_name}"
   location = var.location
   network_security_group_rules = var.network_security_group_rules
   subnet_details = local.subnet_details
   virtual_network_details = local.virtual_network_details
   network_interface_details = local.network_interface_details
   depends_on = [ module.resource-group ]
}

module "virtual-machines" {    
    source="./modules/compute/virtualMachines"
    resource_group_name="${terraform.workspace}-${var.resource_group_name}"
    location=var.location
    virtual_machine_details = local.virtual_machine_details
    network_interface_details = local.network_interface_details
    // We need to add the depends on clause because we are using the data block in virtual machines to get details of network interfaces.
    depends_on = [ module.network ]
}





