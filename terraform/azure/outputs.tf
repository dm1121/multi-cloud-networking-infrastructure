# terraform/azure/outputs.tf
# Outputs for Azure networking resources - useful for verification and cross-cloud references later

output "azure_location_used" {
  description = "The Azure location configured for this deployment"
  value       = var.azure_location
}

output "azure_resource_group_name" {
  description = "Name of the created Azure Resource Group"
  value       = azurerm_resource_group.main.name
}

output "azure_vnet_id" {
  description = "ID of the created Azure Virtual Network"
  value       = azurerm_virtual_network.main.id
}

output "azure_vnet_address_space" {
  description = "Address space of the Azure VNet"
  value       = azurerm_virtual_network.main.address_space
}

output "azure_public_subnet_id" {
  description = "ID of the public subnet"
  value       = azurerm_subnet.public.id
}

output "azure_public_subnet_prefix" {
  description = "Address prefix of the public subnet"
  value       = azurerm_subnet.public.address_prefixes[0]
}
