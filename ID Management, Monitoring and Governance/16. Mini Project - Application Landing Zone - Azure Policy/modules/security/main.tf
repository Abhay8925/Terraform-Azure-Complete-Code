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

data "azurerm_policy_definition" "policies" {
for_each = var.policies
  display_name = each.key
}

resource "random_integer" "policy_suffix" {
    min=100
    max=200
}

data "azurerm_resource_group" "resourcegroup" {
  for_each = var.policies
  name = each.value.resource_group
}

resource "azurerm_resource_group_policy_assignment" "assignpolicy" {
    for_each = var.policies
    name="Assign-Policy-${random_integer.policy_suffix.result}"
    policy_definition_id = data.azurerm_policy_definition.policies[each.key].id
    resource_group_id = data.azurerm_resource_group.resourcegroup[each.key].id

    parameters = <<PARAMS
    {
      "${each.value.parameter_name}": {
        "value": ["${each.value.parameter_value}"]
      }
    }
PARAMS
}