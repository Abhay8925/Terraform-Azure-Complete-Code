output "subnet_ids" {
  value=values(azurerm_subnet.network_subnets)[*].id
}

output "private_ip_address" {
    value={
        for interface in azurerm_network_interface.network_interfaces :
        interface.name => ({
            private_ip_address=interface.private_ip_address
        })
    }
}