location            = "centralindia"
resource_group_name = "arun-rg"
vnet_name           = "arun-vnt1"
address_space       = ["10.11.0.0/16"]

Subnetlist = {
  "list" = {
    name    = ["appgateway-subnet", "aks_subnet", "sql_subnet"]
    address = ["10.11.12.0/24", "10.11.15.0/24", "10.11.16.0/24"]
  }
}

