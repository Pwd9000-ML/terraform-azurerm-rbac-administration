# Azure RBAC Administration on Existing Resources

## Description

This terraform example creates new **AAD groups**, assigns **group owners** and also assigns RBAC permissions on existing resources.

## Usage

1. Clone or copy the files in this path to a local directory and open a command prompt.
2. Amend the .tf file and .tfvars file with desired variables.
3. Log into azure using CLI "az login".
4. **BUILD:**

    ```HCL
    terraform init
    terraform plan -out deploy.tfplan
    terraform apply deploy.tfplan
    ```

5. **DESTROY:**

    ```HCL
    terraform plan -destroy -out destroy.tfplan
    terraform apply destroy.tfplan
    ```  

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | n/a |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rbac-administration"></a> [rbac-administration](#module\_rbac-administration) | Pwd9000-ML/rbac-administration/azurerm | >= 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [azuread_group.rbac](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/group) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |
| [azuread_users.GroupOwners](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/users) | data source |
| [azurerm_key_vault.rbac](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_resource_group.rbac](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aadGroup"></a> [aadGroup](#input\_aadGroup) | The name of the AAD group that will be created. | `string` | `"AAD-group-to-create"` | no |
| <a name="input_azure_rbac_config"></a> [azure\_rbac\_config](#input\_azure\_rbac\_config) | Azure RBAC permision configuration | <pre>list(object({<br>    description          = string<br>    scope                = string<br>    role_definition_name = string<br>    principal_id         = string<br>  }))</pre> | <pre>[<br>  {<br>    "description": "Example - Azure RBAC permision on Subscription",<br>    "principal_id": "00000000-0000-0000-0000-000000000000",<br>    "role_definition_name": "Contributor",<br>    "scope": "/subscriptions/00000000-0000-0000-0000-000000000000"<br>  },<br>  {<br>    "description": "Example - Azure RBAC permision on Resource Group",<br>    "principal_id": "00000000-0000-0000-0000-000000000000",<br>    "role_definition_name": "Contributor",<br>    "scope": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myGroup"<br>  },<br>  {<br>    "description": "Example - Azure RBAC permision on Resource",<br>    "principal_id": "00000000-0000-0000-0000-000000000000",<br>    "role_definition_name": "Contributor",<br>    "scope": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM"<br>  },<br>  {<br>    "description": "Example - Azure RBAC permision on Management Group",<br>    "principal_id": "00000000-0000-0000-0000-000000000000",<br>    "role_definition_name": "Contributor",<br>    "scope": "/providers/Microsoft.Management/managementGroups/myMG"<br>  }<br>]</pre> | no |
| <a name="input_groupOwners"></a> [groupOwners](#input\_groupOwners) | The names of the of the users that will be added as owners to the AD groups. | `list(string)` | <pre>[<br>  "aadGroupOwner@company.com"<br>]</pre> | no |
| <a name="input_keyVaultName"></a> [keyVaultName](#input\_keyVaultName) | Name of the key vault. | `string` | `"existing-kv-name"` | no |
| <a name="input_resourceGroupName"></a> [resourceGroupName](#input\_resourceGroupName) | Name of the resource group where resources are hosted. | `string` | `"existing-rg-name"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->