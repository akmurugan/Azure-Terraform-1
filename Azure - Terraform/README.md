# Scenario:

The Application team requires 2 VMs to be provisioned. They have already written a module for the VM and another one for a Key Vault.
Your job is to reuse the modules in `./modules` and provision 3 instances with the following properties passed in as input parameters:

- Instance size: `Standard_D2_v4`

It has been decided that each VM instance will have a `SystemAssigned` managed identity. You must create a Key Vault, and ensure that
the Managed Identity of each VM is given the following permissions in the Key Vault:

|Access Policy|Permission|
|--------|-------------------|
| Key Permissions | "get", "list" |
| Secret Permissions | "get", "list |

Also output the following values of each VM:

- Admin username
- Admin password
- VM Id
- VM Identity Id

Below is the format:

```hcl-terraform
vm = [
  {
    "admin_password" = <...>
    "admin_username" = <...>
    "id" = <...>
    "identity_id" = "<...>
  },
  {
    "admin_password" = <...>
    "admin_username" = <...>
    "id" = <...>
    "identity_id" = "<...>
  },
  {
    "admin_password" = <...>
    "admin_username" = <...>
    "id" = <...>
    "identity_id" = "<...>
  },
]
```

## Deliverables:

1. Write a clear and understandable README.md file which details deployment process, any input parameters and any outputs.
2. A `private` repository with the code.
3. A blueprint Terraform file that uses the modules to provision the resources.
4. No hardcoded values.
5. Outputs in the format mentioned above.

## Extras:

You can either code or explain how the following could be accomplished:

1. Gitlab pipeline for deployment to a Terraform Cloud workspace.
2. Any tests to check for success or failure of the pipeline.
3. Any improvements to the modules.