# NOTE: This file is located in the 'Module' directory.
# It uses 'resource_group_name' because the pipeline passes this value.

variable "resource_group_name" {
  description = "The name of the resource group, used for resource naming and tagging."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed (e.g., eastus2)."
  type        = string
}

variable "vnet_address_space" {
  description = "The address space (CIDR block) for the Virtual Network (e.g., [\"10.50.0.0/16\"])."
  type        = list(string)
  default     = ["10.50.0.0/16"] # Adding a default makes the root main.tf cleaner
}

variable "subnet_address_prefix" {
  description = "The address prefix (CIDR block) for the subnet (e.g., [\"10.50.1.0/24\"])."
  type        = list(string)
  default     = ["10.50.1.0/24"] # Adding a default makes the root main.tf cleaner
}
