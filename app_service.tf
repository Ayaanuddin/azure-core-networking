# app_service.tf: Deploys the application hosting infrastructure (App Service Plan and App Service).

# 1. Define the App Service Plan (The underlying computing resource)
resource "azurerm_app_service_plan" "app_service_plan" {
  # We reuse the Resource Group name and Location from the core network module's outputs
  name                = "${var.project_name}-app-plan"
  location            = var.location
  resource_group_name = module.core_network.resource_group_name
  kind                = "Linux"

  sku {
    # Using the Basic tier for cost-effectiveness in development/demo
    tier = "Basic"
    size = "B1"
  }
}

# 2. Define the App Service (The application host)
resource "azurerm_app_service" "app_service" {
  name                = "${var.project_name}-web-app"
  location            = var.location
  resource_group_name = module.core_network.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  # Assuming a simple Python or Node app here.
  # If you use a container, you would define 'app_settings' and 'site_config' differently.
  site_config {
    linux_fx_version = "NODE|18-lts" # Example: use Node.js
    always_on        = true
  }

  tags = {
    Environment = "DevOps-Automated"
  }
}
