## Key-vault variables
variable "tenant_id" {
  default = "xxxxxx"
}

variable "object_id" {
default = "xxxxx"
}

variable "sku_name" {
  default = "standard"
}

variable "keyvalut-name" {
  default = "xxxx"
}

## Vms Variables 

variable "admin_password" {
  default = "xxxx"
}

variable "admin_username" {
  default = "xxxx"
}

variable "location" {
  default = "xxxx"
}

variable "instance_count" {
  type = string
  default = ""
  }

variable "name" {
  default = "xxxx"
}

variable "resource_group_name" {
  default = "xxx"
}

variable "size" {
  default = "Standard_D2_v4"
}

variable "caching" {
  default = "xxx"
}

variable "storage_account_type" {
  default = "xxxx"
}

variable "subnet_name" {
  default = "xxx"
}

variable "vnet_name" {
  default = "xxx"
}