# terraform/azure/vnet.tf
# Minimal Azure Virtual Network (VNet) + public subnet

resource "azurerm_resource_group" "main" {
  name     = "${var.environment}-azure-rg"
  location = var.azure_location

  tags = {
    Environment = var.environment
  }
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.environment}-azure-vnet"
  address_space       = ["${var.cidr_prefix}.64.0.0/16"]  # e.g., 10.100.64.0.0/16
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  tags = {
    Name        = "${var.environment}-azure-vnet"
    Environment = var.environment
  }
}

resource "azurerm_subnet" "public" {
  name                 = "${var.environment}-azure-public"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["${var.cidr_prefix}.64.1.0/24"]  # e.g., 10.100.64.1.0/24
}
