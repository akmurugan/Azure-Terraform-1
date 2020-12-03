Terraform - Exercises
Exercise	Details
	

Resources, Variables and Providers	Task:1
Azure
Using Terraform create the following resources in Azure:
1.	Resource Group
2.	Network Security Group
As part of this exercise we will use the following for Azure:
1.	Setup the Azure provider.
2.	Use azurerm resources to provision the components in Azure.
3.	Use Variables to pass input values for the following properties:
1.	Location
2.	Resource Group Name
3.	NSG Name
		

Lists, Maps and Objects	
Azure
Expanding on the previous exercise, create the following resources:
1.	Network Security Group rule
2.	Virtual Network
3.	Subnet
1.	Create an Object variable for the properties of the NSG.
2.	Create a List of String variable for the address_space property.
3.	Create a Map variable for the Subnet.
Data and Output blocks	Task:2
Azure
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

