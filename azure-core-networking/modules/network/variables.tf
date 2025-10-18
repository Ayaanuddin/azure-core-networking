# This file declares the variables that the CLI passes into the Root Module.
# The variable names here MUST match the names used in your -var flags.

variable "resource_group_name" {
  description = "The name of the resource group to be created. Used as a unique identifier for resources."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed (e.g., eastus)."
  type        = string
}

# This is an optional variable to allow overriding the VNet CIDR block.
# It uses the default value defined here if no value is provided.
variable "vnet_address_space" {
  description = "The address space (CIDR block) for the Virtual Network."
  type        = list(string)
  default     = ["10.50.0.0/16"]
}

# This is an optional variable to allow overriding the Subnet CIDR block.
variable "subnet_address_prefix" {
  description = "The address prefix (CIDR block) for the subnet."
  type        = list(string)
  default     = ["10.50.1.0/24"]
}