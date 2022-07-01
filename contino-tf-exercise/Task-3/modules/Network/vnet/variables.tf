variable "resource_group_name" {
  default = ""  
}

variable "location" {
  default = ""  
}

variable "vnet_name" {
  default = ""
}

variable "address_space" {
  default = ""
}

variable "address_space" {
  default = ""
}
  variable "Subnetlist" {
      type = map(object({
        name    = list(string)
        address = list(string)
    }))
    }