provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Service Plan (replacing deprecated resource)
resource "azurerm_service_plan" "service_plan" {
  name                = "${var.resource_group_name}-asp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

# Web App (assuming Windows Web App)
resource "azurerm_windows_web_app" "web_app" {
  name                = "${var.resource_group_name}-webapp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.service_plan.id

  site_config {
    # Your site configuration here
  }
}
