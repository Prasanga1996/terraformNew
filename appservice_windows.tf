

resource "azurerm_app_service_plan" "example" {
  name                = "webapp-asp-windows-${random_integer.ri.result}"
  location            = azurerm_resource_group.Prasanga.location
  resource_group_name = azurerm_resource_group.Prasanga.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "webapp-windows-${random_integer.ri.result}"
  location            = azurerm_resource_group.Prasanga.location
  resource_group_name = azurerm_resource_group.Prasanga.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    windows_fx_version = "node|10.6"
  }
}