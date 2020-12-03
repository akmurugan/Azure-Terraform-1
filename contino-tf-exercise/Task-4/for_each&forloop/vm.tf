provider "azurerm" {
   features {} 
}   

provider "random" {}

   resource "random_password" "this" {
   length  = 16
   special = true
   }

data "azurerm_subnet" "this" {
name                   = var.subnet_name
resource_group_name    = var.resource_group_name
virtual_network_name   = var.virtual_network_name
}

resource "azurerm_network_interface" "NIC" {
   for_each                             = var.VirtualMachines 
  # Accessing keys in the map by each.value            
  name                                  = "${each.value}-nic"  
  resource_group_name                   = var.resource_group_name
  location                              = var.location  

  ip_configuration {
    name                                = each.value
    subnet_id                           = data.azurerm_subnet.this.id
    private_ip_address_allocation       = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "VMs" {

  for_each                               = var.VirtualMachines
  name                                   =  "${each.value}"
  location                               = var.location
  resource_group_name                    = var.resource_group_name
  network_interface_ids                  = [azurerm_network_interface.NIC[each.key].id]
  size                                   = var.size
  admin_username                         = var.admin_username
  admin_password                         = random_password.this.result

source_image_reference {
    publisher                            = "MicrosoftWindowsServer"
    offer                                = "WindowsServer"
    sku                                  = "2016-Datacenter"
    version                              = "latest"
  }

 os_disk {
    caching                              = var.caching
    storage_account_type                 = var.storage_account_type
  }
} 