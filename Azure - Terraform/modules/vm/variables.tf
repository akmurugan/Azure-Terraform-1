variable "admin_password" {
  default = ""
}

variable "admin_username" {
  default = ""
}

variable "location" {
  default = ""
}

variable "name" {
  default = ""
}

variable "resource_group_name" {
  default = ""
}
variable "instance_count" {
  type = string
  default = "1"
}
variable "size" {
  default = ""
}

variable "caching" {
  default = ""
}

variable "storage_account_type" {
  default = ""
}

variable "subnet_id" {
  default = ""
}