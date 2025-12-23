terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.6.0"
    }
  }
backend "azurerm" {
	resource_group_name="terraform-grp"
	storage_account_name="terraformstore45553443"
	container_name="terraform-prod"
	key="terraform.tfstate"
  client_id = "<your-client-id>"
  client_secret = "<your-client-secret>"
  tenant_id = "<your-tenant-id>"
  subscription_id = "<your-subscription-id>"

}
}

provider "azurerm" {
  features {}
  client_id = "<your-client-id>"
  client_secret = "<your-client-secret>"
  tenant_id = "<your-tenant-id>"
  subscription_id = "<your-subscription-id>"
}