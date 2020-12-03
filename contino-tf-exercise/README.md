# Task 1


| Exercise | Description | Details |
|------|-------------|------|---------|:--------:|
| Task1 | Azure
Using Terraform create the following resources in Azure:
1.	Resource Group
2.	Network Security Group

| `string` | `"StorageV2"` | no |
| account\_replication\_type | (Optional) Defines the type of replication to use for this storage account | `string` | `"LRS"` | no |
| account\_tier | (Optional) Defines the Tier to use for this storage account | `string` | `"Standard"` | no |
| base\_name | (Required) Base name to be used as prefix for all created resources | `string` | n/a | yes |
| containers | (Required) List of storage container names within the storage account | `list(string)` | n/a | yes |
| folder\_permissions | (Optional) list of folder permissions to set | <pre>list(object({<br>    group_name     = string<br>    permissions    = string<br>    directory_path = string<br>    container      = string<br>  }))</pre> | `[]` | no |
| is\_hns\_enabled | (Optional) Enable Heirarchy level namespace, required to enable folder creation and access | `bool` | `true` | no |
| location | (Required) Location to deploy the resource | `string` | n/a | yes |
| name | (Required) Storage Account name | `string` | n/a | yes |
| network\_rules | (Optional) Network acl rules for the storage account | <pre>object({<br>    ip_rules                   = list(string)<br>    virtual_network_subnet_ids = list(string)<br>  })</pre> | `null` | no |
| resource\_group\_name | (Required) sResource group name | `string` | n/a | yes |
| storage\_folders | (Optional) names of the storage folders to create | <pre>list(object({<br>    directory_path = string<br>    container      = string<br>  }))</pre> | `[]` | no |
| tags | (Optional) Tags for categorization | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| containers | Containers for the storage account |
| id | resource id of the storage account |
| name | Name of the storage account |
| primary\_access\_key | primary access key for the storage account |
| primary\_connection\_string | primary connection string for the storage account |
| resource | Storage account resource |

## Using it in a blueprint

IMPORTANT: We periodically release versions for the components. Since, master branch may have breaking changes, best practice would be to use a released version in form of a tag (e.g. ?ref=x.y.z)

```terraform
module "storage_account" {
  source = "git@gitlab.com:/bhp-cloudfactory/components/terraform-azurerm-storage-account?ref=v0.8.1"
  base_name           = var.base_name
  name                = var.storage_account.name
  containers          = var.storage_account.containers
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  network_rules       = var.network_rules
  storage_folders     = var.storage_folders
  folder_permissions  = var.folder_permissions
  is_hns_enabled      = var.is_hns_enabled
}
```

Sample values can be seen in [tests/vars/test-input.tfvars](tests/vars/test-input.tfvars)

## Testing

You can use our Dev Helper script suite to test or deploy the blueprint from your local system.

To see the available options, please execute the following command.

```bash
./tests/dev-scripts/helper.sh
```

ps: Feel free to replace the pipeline variables in `tests/dev-scripts/variables.sh` if required.

### Manual Testing

The following set of commands can be executed to deploy the blueprint from your local system and then destroy it.

```bash
./tests/dev-scripts/helper.sh setup # Sets up dependencies, injects variables values etc.
./tests/dev-scripts/helper.sh tfplan # Terraform plan
./tests/dev-scripts/helper.sh tfapply # Terraform apply
./tests/dev-scripts/helper.sh undo # Terraform destroy + removes dependencies and injected variables.
```

### Automated testing

The following set of commands can be executed to execute unit testing and integration testing from your local system.

```shell script
./tests/dev-scripts/helper.sh setup # Sets up dependencies, injects variables values etc.
./tests/dev-scripts/helper.sh unit # Unit testing with Golang Terratest.
./tests/dev-scripts/helper.sh integration # Integration testing with Golang Terratest.
./tests/dev-scripts/helper.sh undo # Terraform destroy + removes dependencies and injected variables.
```

## Continuous Integration Pipeline

The CI pipeline is defined in ci-pipeline.yml. Read more about Azure Pipelines YAML [here](https://docs.microsoft.com/en-us/azure/devops/pipelines/yaml-schema?view=azure-devops&tabs=schema%2Cparameter-schema).
The component's pipeline extends the [pipeline template](https://dev.azure.com/AzureCloudEngineering/azure-components/_git/azr-components?path=%2Fpipeline-templates).

The CI pipeline dependencies :

- tests/vars/test-input.tfvars : Input for unit and integration testing.
- tests/dependencies.tf : Dependent resources(if any) to be created for integration testing.
- tests/test-provider.tf : Provider block.
- .azuredevops folder : This contains the Pull Request template which has placeholders for:

  - Pull request change impact (major/minor/patch) to be used for Semantic Versioning using Git tags.
  - Common content to be automatically used for Git tag description and CHANGELOG.md.
