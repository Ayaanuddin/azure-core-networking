# main.tf: The entry point for the Terraform project.
# This file initializes the provider and passes variables to the 'core_network' module.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# 1. Configure the Azure Provider
provider "azurerm" {
  features {}
}

# 2. Define Root Variables (These will get values from terraform.tfvars)
variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "East US 2"
}

variable "project_name" {
  description = "A unique prefix for all resources (e.g., 'acme-prod')."
  type        = string
}

variable "vnet_address_space" {
  description = "The CIDR block for the VNet."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefix" {
  description = "The CIDR block for the primary subnet."
  type        = list(string)
  default     = ["10.0.1.0/24"]
}


# 3. Call the Network Module
module "core_network" {
  # This line tells Terraform where to find the module definition
  # It points to the 'modules/network/main.tf' file
  source = "./modules/network" 

  # Pass the variable values into the module
  project_name          = var.project_name
  location              = var.location
  vnet_address_space    = var.vnet_address_space
  subnet_address_prefix = var.subnet_address_prefix
}
