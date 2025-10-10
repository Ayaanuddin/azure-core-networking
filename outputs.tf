# outputs.tf: Defines outputs that will be visible after terraform apply.

# Output the Resource Group Name from the core network module
output "resource_group_name" {
  value       = module.core_network.resource_group_name
  description = "The name of the main Resource Group."
}

# Output the URL of the newly created Azure App Service
output "app_service_default_hostname" {
  value       = azurerm_app_service.app_service.default_site_hostname
  description = "The default URL (hostname) for the deployed App Service."
}
