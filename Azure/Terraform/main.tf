resource "azurerm_resource_group" "ifidemo" {
  name     = "rg-ifidemo-terraform"
  location = "westeurope"
}

resource "azurerm_app_service_plan" "appplan" {
  name                = "asp-ifidemo-terraform"
  resource_group_name = azurerm_resource_group.ifidemo.name
  location            = azurerm_resource_group.ifidemo.location
  
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "apiwebapp" {
  name                = "app-ifidemo-terraform"
  resource_group_name = azurerm_resource_group.ifidemo.name
  location            = azurerm_app_service_plan.appplan.location
  app_service_plan_id     = azurerm_app_service_plan.appplan.id

  site_config {
    use_32_bit_worker_process = true
  }
}

resource "azurerm_static_site" "staticwebapp" {
  name                = "stapp-ifidemo-terraform"
  resource_group_name = azurerm_resource_group.ifidemo.name
  location            = azurerm_resource_group.ifidemo.location
}