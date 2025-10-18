terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Define local variable for project name
locals {
  project_name = "${var.project_prefix}-${var.environment}"
}

# Call the module
module "core_network" {
  source = "./modules/network"

  project_name          = local.project_name
  location              = var.location
  vnet_address_space    = var.vnet_address_space
  subnet_address_prefix = var.subnet_address_prefix
}