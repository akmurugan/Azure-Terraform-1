variable "location" {
  default = ""
}

variable "resource_group_name" {
  default = ""  
}

variable "subnet_name" {
  default = ""  
}

variable "virtual_network_name" {
  default = ""  
}

variable "VirtualMachines" {
  type = "map"
  default = {
    vm1 = ""
    vm2 = ""
  }
 
}  

variable "admin_password" {
  default = ""
}

variable "admin_username" {
  default = ""
}

variable "caching" {
  default = ""
}

variable "size" {
  default = ""
}

variable "storage_account_type" {
  default = ""
}