variable "resource_group_name" {
  type= string
  description = "This defines the name of the resource group"
}

variable "location" {
  type= string
  description = "This defines the location of the resource group and the resources"
}

variable "number_of_machines" {
  type=number
  description = "These are the number of machines in the backend pool of the Load Balancer"
}

variable "network_interface_private_ip_address" {
  type=list(string) 
  description = "This is the private IP addresses of the network interfaces attached to the virtual machines"
}

variable "virtual_network_id" {
  type=string
  description = "This is the resource id of the virtual network"
}

