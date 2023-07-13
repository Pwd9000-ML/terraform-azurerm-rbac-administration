# Azure RBAC Administration on New Resources

## Description

This terraform example creates new a new **Resource group** and **Key Vault**, and assigns the **Current User** with RBAC permissions against the newly created resources.  

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
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rbac-administration"></a> [rbac-administration](#module\_rbac-administration) | Pwd9000-ML/rbac-administration/azurerm | >= 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.kv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [random_integer.number](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_rbac_config"></a> [azure\_rbac\_config](#input\_azure\_rbac\_config) | Azure RBAC permision configuration | <pre>list(object({<br>    description          = string<br>    scope                = string<br>    role_definition_name = string<br>    principal_id         = string<br>  }))</pre> | <pre>[<br>  {<br>    "description": "Example - Azure RBAC permision on Subscription",<br>    "principal_id": "00000000-0000-0000-0000-000000000000",<br>    "role_definition_name": "Contributor",<br>    "scope": "/subscriptions/00000000-0000-0000-0000-000000000000"<br>  },<br>  {<br>    "description": "Example - Azure RBAC permision on Resource Group",<br>    "principal_id": "00000000-0000-0000-0000-000000000000",<br>    "role_definition_name": "Contributor",<br>    "scope": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myGroup"<br>  },<br>  {<br>    "description": "Example - Azure RBAC permision on Resource",<br>    "principal_id": "00000000-0000-0000-0000-000000000000",<br>    "role_definition_name": "Contributor",<br>    "scope": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM"<br>  },<br>  {<br>    "description": "Example - Azure RBAC permision on Management Group",<br>    "principal_id": "00000000-0000-0000-0000-000000000000",<br>    "role_definition_name": "Contributor",<br>    "scope": "/providers/Microsoft.Management/managementGroups/myMG"<br>  }<br>]</pre> | no |
| <a name="input_kv_config"></a> [kv\_config](#input\_kv\_config) | Key Vault configuration object to create azure key vault. | <pre>object({<br>    name = string<br>    sku  = string<br>  })</pre> | <pre>{<br>  "name": "rbactestkv",<br>  "sku": "standard"<br>}</pre> | no |
| <a name="input_kv_net_rules"></a> [kv\_net\_rules](#input\_kv\_net\_rules) | n/a | <pre>list(object({<br>    default_action             = string<br>    bypass                     = string<br>    ip_rules                   = list(string)<br>    virtual_network_subnet_ids = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "bypass": "AzureServices",<br>    "default_action": "Deny",<br>    "ip_rules": [<br>      "0.0.0.0/0"<br>    ],<br>    "virtual_network_subnet_ids": []<br>  }<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region to deploy resources to. | `string` | `"uksouth"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group where resources will be hosted. | `string` | `"resource-group-name-to-create"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of key value pairs that is used to tag resources created. | `map(string)` | <pre>{<br>  "Author": "Marcel Lupo",<br>  "Description": "Automated test for RBAC administration module.",<br>  "GitHub": "https://registry.terraform.io/modules/Pwd9000-ML/rbac-administration/azurerm/latest",<br>  "Terraform": "True"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->