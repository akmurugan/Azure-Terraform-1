variable "resource_group_name" {
  default = ""  
}

variable "location" {
  default = ""  
}

variable "nsg_name" {
  default = ""  
}

variable "virtual_network_name" {
  default = ""  
}

variable "security_rule" {
  type = object(
    {
        name                          = string
        priority                      = number
        access                        = string
        protocol                      = string 
        direction                     = string
   }
      )

  default =  {
        name                           =  ""
        priority                       =  100 
        access                         =  ""
        protocol                       =  ""   
        direction                      =  ""
 }

}

variable "address_space" {
  type    = list(string)
}

variable "dns_servers" {
  type =  list(string)
}

variable "subnet_names" {
 default = ""
}

variable "subnet" {
  type = map
  default = {
    name           = ""
    address_prefix = ""
  }
}
