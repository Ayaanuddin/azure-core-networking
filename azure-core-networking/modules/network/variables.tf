
# modules/network/variables.tf

variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
}

variable "subnet_address_prefix" {
  description = "Subnet address prefix"
  type        = list(string)
}

variable "project_prefix" {
  description = "Prefix for project resources"
  type        = string
  default     = "myproject"
}

variable "environment" {
  description = "Deployment environment (dev, prod, etc.)"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure location for resources"
  type        = string
  default     = "eastus"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}
