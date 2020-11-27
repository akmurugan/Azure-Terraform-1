resource "azurerm_key_vault" "kv" {
  location                    = var.location
  name                        = var.name
  resource_group_name         = var.resource_group_name
  sku_name                    = var.sku_name
  tenant_id                   = var.tenant_id
  #object_id                   = var.objects_id
  enabled_for_disk_encryption = true

access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id
    key_permissions = [
      "get", "list"
    ]
   secret_permissions = [
      "get","list"
    ]
    }
 }