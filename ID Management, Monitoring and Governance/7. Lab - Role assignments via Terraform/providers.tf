terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.6.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "3.0.2"
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

provider "azuread" {
  client_id = "<your-client-id>"
  client_secret = "<your-client-secret>"
  tenant_id = "<your-tenant-id>"
}