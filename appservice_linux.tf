resource "random_integer" "ri" {
  min = 10000
  max = 99999
}

resource "azurerm_service_plan" "example2" {
  name                = "webapp-asp-${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.Prasanga.name
  location            = azurerm_resource_group.Prasanga.location
  os_type             = "Linux"
  sku_name            = "B1"

}

resource "azurerm_linux_web_app" "example2" {
  name                = "webapp-${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.Prasanga.name
  location            = azurerm_service_plan.example2.location
  service_plan_id     = azurerm_service_plan.example2.id


  site_config {
    application_stack {
      node_version = "16-lts"
    }
  }
}
