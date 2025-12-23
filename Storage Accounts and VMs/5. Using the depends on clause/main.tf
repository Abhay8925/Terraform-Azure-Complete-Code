terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.4.0"
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

resource "azurerm_storage_account" "appstore400009078" {
  name                     = "appstore400009078"
  resource_group_name      = azurerm_resource_group.appgrp.name
  location                 = "North Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"  
}

resource "azurerm_storage_container" "scripts" {
  name                  = "scripts"
  storage_account_name  = azurerm_storage_account.appstore400009078.name
  depends_on = [ azurerm_storage_account.appstore400009078 ]
}

resource "azurerm_storage_blob" "script01" {
  name                   = "script01.ps1"
  storage_account_name   = azurerm_storage_account.appstore400009078.name
  storage_container_name = azurerm_storage_container.scripts.name
  type                   = "Block"
  source                 = "script01.ps1"
}