resource "random_integer" "keyvault_suffix" {
    min=900000
    max=1000000
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvaults" {
    for_each = var.keyvaults
    name = "${each.key}${random_integer.keyvault_suffix.result}"
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    soft_delete_retention_days = 7
    purge_protection_enabled = false
    sku_name = "standard"
    tenant_id = data.azurerm_client_config.current.tenant_id
}