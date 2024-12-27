[![Manual-Tests-and-Release](https://github.com/Pwd9000-ML/terraform-azurerm-rbac-administration/actions/workflows/manual-test-release.yml/badge.svg)](https://github.com/Pwd9000-ML/terraform-azurerm-rbac-administration/actions/workflows/manual-test-release.yml) [![Automated-Dependency-Tests-and-Release](https://github.com/Pwd9000-ML/terraform-azurerm-rbac-administration/actions/workflows/dependency-tests.yml/badge.svg)](https://github.com/Pwd9000-ML/terraform-azurerm-rbac-administration/actions/workflows/dependency-tests.yml) [![Dependabot](https://badgen.net/badge/Dependabot/enabled/green?icon=dependabot)](https://dependabot.com/)  

# Module: Azure RBAC Administration

## Description

Terraform Registry module for administering **AZURE role assignments (RBAC)**.

See **[RBAC administration on new resources](https://github.com/Pwd9000-ML/terraform-azurerm-rbac-administration/tree/master/examples/azure_rbac_new_resources):**  
For an example of how to administer RBAC permissions against newly created **AZURE** resources.  

See **[RBAC administration on existing resources](https://github.com/Pwd9000-ML/terraform-azurerm-rbac-administration/tree/master/examples/azure_rbac_exising_resources):**  
For an example of how to administer RBAC permissions against existing **AZURE** resources.  

This module is published on the **[Public Terraform Registry - rbac-administration](https://registry.terraform.io/modules/Pwd9000-ML/rbac-administration/azurerm/latest)**  

Enjoy!

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.rbac](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_rbac_config"></a> [azure\_rbac\_config](#input\_azure\_rbac\_config) | Azure RBAC role assignment (permissions) configuration. | <pre>list(object({<br/>    description          = string<br/>    scope                = string<br/>    role_definition_name = string<br/>    principal_id         = string<br/>  }))</pre> | <pre>[<br/>  {<br/>    "description": "Example - Azure RBAC permision on Subscription",<br/>    "principal_id": "00000000-0000-0000-0000-000000000000",<br/>    "role_definition_name": "Contributor",<br/>    "scope": "/subscriptions/00000000-0000-0000-0000-000000000000"<br/>  },<br/>  {<br/>    "description": "Example - Azure RBAC permision on Resource Group",<br/>    "principal_id": "00000000-0000-0000-0000-000000000000",<br/>    "role_definition_name": "Contributor",<br/>    "scope": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myGroup"<br/>  },<br/>  {<br/>    "description": "Example - Azure RBAC permision on Resource",<br/>    "principal_id": "00000000-0000-0000-0000-000000000000",<br/>    "role_definition_name": "Contributor",<br/>    "scope": "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM"<br/>  },<br/>  {<br/>    "description": "Example - Azure RBAC permision on Management Group",<br/>    "principal_id": "00000000-0000-0000-0000-000000000000",<br/>    "role_definition_name": "Contributor",<br/>    "scope": "/providers/Microsoft.Management/managementGroups/myMG"<br/>  }<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_assignment_ids"></a> [role\_assignment\_ids](#output\_role\_assignment\_ids) | The Role Assignment IDs. |
<!-- END_TF_DOCS -->