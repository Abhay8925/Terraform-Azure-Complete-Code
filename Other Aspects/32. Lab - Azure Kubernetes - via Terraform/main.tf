resource "azurerm_resource_group" "group" {
  name     = "container-grp"
  location = "North Europe"
}

data "azurerm_container_registry" "appregistry50000" {
  name                = "appregistry50000"
  resource_group_name = "terraform-grp"
}

resource "azurerm_kubernetes_cluster" "kubernetes" {
  name                = "cluster1000"
  location            = azurerm_resource_group.group.location
  resource_group_name = azurerm_resource_group.group.name
  dns_prefix          = "appcluster"

   default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
 identity {
    type = "SystemAssigned"
  }
  
  }

  resource "azurerm_role_assignment" "kubernetes-registry" {
  principal_id                     = azurerm_kubernetes_cluster.kubernetes.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = data.azurerm_container_registry.appregistry50000.id
  skip_service_principal_aad_check = true
}