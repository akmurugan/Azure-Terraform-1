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

   ## Create a Key-vault resource & set access policy
   module "keyvalut" {
   source              = "../modules/key-vault"
   location            = var.location
   name                = var.keyvalut-name
   resource_group_name = var.resource_group_name
   sku_name            = var.sku_name
   tenant_id           = var.tenant_id
   object_id           = var.object_id
   }
   
   ## Create a windows vms using Modules
   module "windowsvms" {
   source                = "../modules/vm"
   name                  = var.name
   resource_group_name   = var.resource_group_name
   location              = var.location
   admin_password        = random_password.this.result
   admin_username        = var.admin_username
   size                  = var.size   
   caching               = var.caching
   storage_account_type  = var.storage_account_type
   subnet_id             = data.azurerm_subnet.this.id
   }
   
## Create a virual Network & subnet using modules

module "vnet" {
  source              = "../modules/Network/vnet"
  Subnetlist          = var.Subnetlist
  vnet_name           = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
}
