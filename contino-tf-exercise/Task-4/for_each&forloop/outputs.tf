
output "Vm-ids" {
  
  value = [
    for id in azurerm_windows_virtual_machine.VMs : id.id
  ]
}