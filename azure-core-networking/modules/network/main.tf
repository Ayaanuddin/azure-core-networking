# This block sets up the Azure provider configuration.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# The Azure provider configuration.
provider "azurerm" {
  features {}
}

# -----------------------------------------------------
# Locals: Define derived values once for reuse
# -----------------------------------------------------

locals {
  # Concatenate project_prefix and environment to create a base name for all resources
  project_name = "${var.project_prefix}-${var.environment}"
}

# -----------------------------------------------------
# Module: Core Network Deployment
# -----------------------------------------------------

# The core_network module handles the Resource Group, VNet, and Subnet creation.
module "core_network" {
  # This path should point to your network module directory
  source = "./modules/network"

  # 1. Project Naming: Use the combined local variable
  # NOTE: The module expects 'project_name', so we pass the local value to it.
  project_name = local.project_name

  # 2. Location: Pass the location variable from the root to the module
  location = var.location

  # 3. VNet Address Space: Pass the VNet CIDR block
  vnet_address_space = var.vnet_address_space

  # 4. Subnet Address Prefix: Pass the Subnet CIDR block
  subnet_address_prefix = var.subnet_address_prefix
}
