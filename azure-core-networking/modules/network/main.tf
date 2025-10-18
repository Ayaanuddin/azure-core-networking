# modules/network/main.tf

# Create a Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.project_name}-vnet"
  location            = var.location
  address_space       = var.vnet_address_space
  resource_group_name = "${var.project_name}-rg"
}

# Create a subnet
resource "azurerm_subnet" "subnet" {
  name                 = "${var.project_name}-subnet"
  resource_group_name  = "${var.project_name}-rg"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefix
}

# main.tf
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
