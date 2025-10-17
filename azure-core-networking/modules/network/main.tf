# This file MUST be in the main folder where you run 'terraform plan'.
# It declares the variables that your pipeline is passing in via '-var' flags.

# 1. Resource Group Name (REQUIRED by your pipeline to stop the error)
variable "resource_group_name" {
  description = "The name of the Resource Group, which will be used as the base name for all resources."
  type        = string
}

# 2. Azure Location (REQUIRED by your pipeline)
variable "location" {
  description = "The Azure region to deploy resources (e.g., 'eastus')."
  type        = string
}

# 3. VNet Address Space (For configuration)
variable "vnet_address_space" {
  description = "The address space (CIDR block) for the Virtual Network."
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

# 4. Subnet Address Prefix (For configuration)
variable "subnet_address_prefix" {
  description = "The address prefix (CIDR block) for the subnet."
  type        = list(string)
  default     = ["10.10.1.0/24"]
}