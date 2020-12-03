VirtualMachines       = {
                          vm1 = "arunkumar-vm1"
                          vm2 = "arunkumar-vm2"
                        }

location               = "centralindia"
resource_group_name    = "arun-rg"
size                   = "Standard_DS1_v2"
admin_username         = "testadmin"
caching                = "ReadWrite"
storage_account_type   = "Standard_LRS"
subnet_name            = "subnet1"
virtual_network_name   = "arun-vnt" 