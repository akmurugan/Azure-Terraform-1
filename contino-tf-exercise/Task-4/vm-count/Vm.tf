provider "azurerm" {
  features {}
}
provider "random" {}

   resource "random_password" "this" {
   length  = 16
   special = true
   }

 data "azurerm_subnet" "this" {
   name                 = var.subnet_name
   resource_group_name  = var.resource_group_name
   virtual_network_name = var.virtual_network_name
   }

resource "azurerm_windows_virtual_machine" "vm" {
  admin_password        = random_password.this.result
  admin_username        = var.admin_username
  location              = var.location
  count                 = var.instance_count
  name                  = "${var.name}-${count.index}"
  network_interface_ids = [element(azurerm_network_interface.ni.*.id, count.index)]
  resource_group_name   = var.resource_group_name
  size                  = var.size

  source_image_reference {  
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2016-Datacenter"
      version   = "latest"
  }

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }
}

resource "azurerm_network_interface" "ni" {
  count               = var.instance_count
  location            = var.location
  name                = "${var.name}-ni-${count.index}"
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.name
    subnet_id                     = data.azurerm_subnet.this.id
    private_ip_address_allocation = "Dynamic"
  }
}