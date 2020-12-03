resource_group_name    = "arun-rg"
location               = "centralindia"
nsg_name               = "arun-nsgp"
virtual_network_name   = "arun-vnt"
address_space          = ["10.0.0.0/16"]
dns_servers            = ["10.0.0.4", "10.0.0.5"]
subnet                 = {
   name             =   "subnet1"
   address_prefix   = "10.0.1.0/24"
} 

security_rule = {
   name                   =  "test123"
   priority               =  101 
   access                 =  "Allow"
   protocol               =  "TCP"   
   direction              =  "Inbound"
}