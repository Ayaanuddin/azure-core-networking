output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.core_vnet.id
}

output "vnet_address_space" {
  description = "The address space of the Virtual Network"
  value       = azurerm_virtual_network.core_vnet.address_space
}

