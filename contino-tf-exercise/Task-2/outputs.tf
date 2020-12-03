output "virtual_network_id" {
  value = data.azurerm_virtual_network.vnet.id
}

output "resource_group_id" {
  value = data.azurerm_resource_group.rg.id
}

output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}