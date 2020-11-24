provider "azurerm" {
   features {} 
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
  count                 = var.instance_count
  name                  = "${var.name}-${count.index}"
  resource_group_name   = var.resource_group_name
  location              = var.location
  admin_password        = var.admin_password
  admin_username        = var.admin_username
  size                  = var.size   
  caching               = var.caching
  storage_account_type  = var.storage_account_type
  subnet_id             = var.subnet_id
 }