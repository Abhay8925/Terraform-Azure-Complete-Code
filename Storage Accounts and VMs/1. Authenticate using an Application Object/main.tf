// More information on the Azure Terraform provider is available in the below link
// https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

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