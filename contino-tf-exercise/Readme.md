Task:1

Exercises : Resources, Variables and Providers

Using Terraform create the following resources in Azure:
1.	Resource Group
2.	Network Security Group

Detials: 
1.	Setup the Azure provider.
2.	Use azurerm resources to provision the components in Azure.
3.	Use Variables to pass input values for the following properties:
1.	Location
2.	Resource Group Name
3.	NSG Name

Exercises : Lists, Maps and Objects

Expanding on the previous exercise, create the following resources:
1.	Network Security Group rule
2.	Virtual Network
3.	Subnet

Details:
1.	Create an Object variable for the properties of the NSG.
2.	Create a List of String variable for the address_space property.
3.	Create a Map variable for the Subnet.

Task:2

Exercises : Data and Output blocks

The focus of this exercise is to use data and output in Terraform.
1.	Create a data block to extract the current subscription
2.	Create outputs for the following items:
1.	Virtual Network ID
2.	Resource Group ID
3.	Subscription Name

Terraform documentation:
1.	Data Sources - Link
o	azurerm_subscription
2.	Outputs - Link

Task:3

Exercises : Modules

Details:
1.	Create modules for the following resources
1.	Network - Vnet, subnets
2.	Virtual Machine
3.	Key Vault
2.	Create a main.tf file that will use the above source modules and provision the resources.

Task: 4

Exercises : Loops (for_each, count, for)

Details:
1.	count exercise
1.	Use the count property to provision 3 VMs.
2.	Use a for loop to iterate over all VMs and output the VM Id .
2.	for_each exercise
1.	Create a map variable for VMs.
2.	Use a for_each statement to loop across each map item to provision the resources.
3.	Use a forloop to iterate over all VMs and output the VM Id .





