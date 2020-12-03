provider "azurerm" {
  features {}  
}
resource "azurerm_resource_group" "rg" {
  name                        = var.resource_group_name 
  location                    = var.location
}

resource "azurerm_network_security_group" "NSG" {
  name                        = var.nsg_name
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  security_rule {
    name                       = var.security_rule.name
    priority                   = var.security_rule.priority
    direction                  = var.security_rule.direction
    access                     = var.security_rule.access
    protocol                   = var.security_rule.protocol
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                        = var.virtual_network_name
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  address_space               = var.address_space
  dns_servers                 = var.dns_servers

  subnet {
      name                    = var.subnet.name
      address_prefix          = var.subnet.address_prefix
    }
}
