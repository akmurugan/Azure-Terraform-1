Getting Started with Terraform on Azure Modules:

Prerequisites:
Before you begin, you will need to set up the following:

 * Azure subscription
 * Powershell 5.1 or Azure Cloud shell and Azure CLI
 * Install Terraform

 Step -1 : Creating Modules
 
   This Terraform exercises consist of Two modules:- 
   1.Keyvault Module, 2. VM's Module
    
    
    We will start by creating a modules folder and then reference that module in another Terraform configuration. We will begin with a folder hierarchy like the following:

Folder structure below:
  Azure-Terraform                                  
    └──modules--(main.tf)
           └──key-vault
                    └── kv.tf
                    └── variables.tf
                    └── output.tf

    Azure-Terraform                                 
    └──modules--(main.tf)
           └──Vm
             └── vm.tf
             └── variables.tf
             └── output.tf

   Step -2
     Run terraform init :-
        If we run a terraform init we can see in the console output that the module is downloaded from the local drive and saved to the Azure-terraform/modules directory.

  Step -3
   Run terraform plan :- 
      Before you can create infrastructure, Terraform needs to generate an execution plan.   

  Step -4 
  Run  terraform apply command to apply your configuration.This output shows the execution plan and will prompt you for approval before proceeding. If anything in the plan seems incorrect or dangerous, it is safe to abort here with no changes made to your infrastructure. Type yes at the confirmation prompt to proceed.
 
 After confirming your execution plan, Terraform will create your Azure Keyvault and 2 Windows VM's.
