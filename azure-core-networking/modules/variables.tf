variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "myVNet"
}

variable "address_space" {
  description = "Address space for the VNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "location" {
  description = "Azure location for the VNet"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}
