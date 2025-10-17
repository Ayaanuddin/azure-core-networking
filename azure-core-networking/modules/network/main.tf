# This file contains the actual Azure resource definitions for the network module.

#
# 1. Azure Resource Group
# The resource group is created here based on the project_name variable.
#
resource "azurerm_resource_group" "rg" {
  # Uses the input variable to set the name and location
  name     = "${var.project_name}-rg"
  location = var.location
}

#
# 2. Azure Virtual Network (VNet)
#
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.project_name}-vnet"
  # This uses the location of the resource group just created
  location            = azurerm_resource_group.rg.location
  # This uses the name of the resource group just created
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
  description = "The ID of the created Virtual Network (VNet)."
  value       = azurerm_virtual_network.vnet.id
}