# This file is located in the project's root directory (e.g., /project_root/variables.tf).
# It defines variables used to configure the entire deployment.

# 1. Project Prefix
# This is used as the base name for all resources to ensure unique naming.
variable "project_prefix" {
  description = "A short prefix used for all resource names (e.g., 'proj-web-app')."
  type        = string
}

# 2. Environment Tag
# This defines the environment (dev, test, prod) which is often appended to names.
variable "environment" {
  description = "The environment name (e.g., 'dev', 'prod')."
  type        = string
}

# 3. Azure Location
# The region where all resources will be deployed.
variable "location" {
  description = "The Azure region to deploy resources (e.g., 'East US', 'West Europe')."
  type        = string
}

# 4. VNet Address Space (Optional for customization)
# Allows overriding the default VNet CIDR block defined in your network module.
variable "vnet_address_space" {
  description = "The address space (CIDR block) for the Virtual Network."
  type        = list(string)
  default     = ["10.10.0.0/16"]
}