resource "azurerm_public_ip" "firewallip" {
  name                = "firewall-ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static" 
  sku="Standard"
  sku_tier = "Regional"
}

resource "azurerm_subnet" "firewallsubnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.10.0/24"]  
}

resource "azurerm_firewall_policy" "firewallpolicy" {
  name                = "firewallpolicy"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_firewall" "appfirewall" {
  name                = "appfirewall"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.firewallsubnet.id
    public_ip_address_id = azurerm_public_ip.firewallip.id
  }

  sku_tier = "Standard"
  sku_name = "AZFW_VNet"

  firewall_policy_id = azurerm_firewall_policy.firewallpolicy.id
  
}

