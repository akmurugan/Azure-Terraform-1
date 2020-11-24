output "vm" {
  value = map("admin_password", module.windowsvms.vm-admin_username,
          "admin_username", module.windowsvms.vm-admin_password,
          "id", module.windowsvms.vm-id,
          "identity-id", module.windowsvms.vm-identity-id)
}