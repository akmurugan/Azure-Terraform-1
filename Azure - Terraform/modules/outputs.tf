## Key-vault Output
output "id" {
  value = module.keyvalut.id
}
## VM's Ouput
output "vm-id" {
   value = module.windowsvms.vm-id
  }
 
output "vm-identity-id" {
  value = module.windowsvms.vm-identity-id
}
 output  "vm-admin_username" {
  value =  module.windowsvms.vm-admin_username
}
output "vm-admin_password" {
  value = module.windowsvms.vm-admin_password
}