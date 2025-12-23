resource "azurerm_resource_group" "group" {
  name     = "container-grp"
  location = "North Europe"
}

data "azurerm_container_registry" "appregistry50000" {
  name                = "appregistry50000"
  resource_group_name = "terraform-grp"
}

resource "azurerm_container_group" "container-instance" {
  name                = "app-instance1000"
  location            = azurerm_resource_group.group.location
  resource_group_name = azurerm_resource_group.group.name
  ip_address_type     = "Public"
  os_type             = "Linux"
  container {
    name   = "php-container"
    image  = "appregistry50000.azurecr.io/phpapp:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }    
  }

  image_registry_credential {
        server=data.azurerm_container_registry.appregistry50000.login_server
        username = data.azurerm_container_registry.appregistry50000.admin_username
        password = data.azurerm_container_registry.appregistry50000.admin_password
    }
  }