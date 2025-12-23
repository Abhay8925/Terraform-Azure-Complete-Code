terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.5.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id = "<your-client-id>"
  client_secret = "<your-client-secret>"
  tenant_id = "<your-tenant-id>"
  subscription_id = "<your-subscription-id>"
}

resource "azurerm_resource_group" "appgrp" {
  name     = "app-grp"
  location = "North Europe"
}

// https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network

resource "azurerm_virtual_network" "app_network" {
  name                = "app-network"
  location            = "North Europe"
  resource_group_name = azurerm_resource_group.appgrp.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name             = "websubnet01"
    address_prefixes = ["10.0.0.0/24"]
  }

  subnet {
    name             = "appsubnet01"
    address_prefixes = ["10.0.1.0/24"]
  }
 
}

