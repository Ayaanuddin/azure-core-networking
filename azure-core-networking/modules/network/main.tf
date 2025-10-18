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

module "core_network" {
  # !!! IMPORTANT: Check this line !!!
  source = "./modules/network"

  # All other required variables:
  project_name          = local.project_name
  location              = var.location
  vnet_address_space    = var.vnet_address_space
  subnet_address_prefix = var.subnet_address_prefix
}
