# This file contains the actual Azure resource definitions for the network module.
# It uses the variables defined in variables.tf for configuration.

#
# 1. Azure Resource Group
# The resource group is created here based on the project_name variable.
#
resource "azurerm_resource_group" "rg" {
  # The name is constructed using the input project_name and a suffix
  name     = "${var.project_name}-rg"
  location = var.location
}

#
# 2. Azure Virtual Network (VNet)
#
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.project_name}-vnet"
  # VNet must be in the same location as the resource group
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  # Uses the input list variable for the address space
  address_space       = var.vnet_address_space
}

#
# 3. Azure Subnet
#
resource "azurerm_subnet" "subnet" {
  name                 = "${var.project_name}-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name

  # Uses the input list variable for the address prefix
  address_prefixes     = var.subnet_address_prefix
}

# Output the VNet ID so the root module can reference it if needed
output "vnet_id" {
  description = "The ID of the newly created Virtual Network."
  value       = azurerm_virtual_network.vnet.id
}