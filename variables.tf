variable "azure_rbac_config" {
  type = list(object({
    description          = string
    scope                = string
    role_definition_name = string
    principal_id         = string
  }))
  default = [
    {
      description          = "Example - Azure RBAC permision on Subscription"
      scope                = "/subscriptions/00000000-0000-0000-0000-000000000000"
      role_definition_name = "Contributor"
      principal_id         = "00000000-0000-0000-0000-000000000000"
    },
    {
      description          = "Example - Azure RBAC permision on Resource Group"
      scope                = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myGroup"
      role_definition_name = "Contributor"
      principal_id         = "00000000-0000-0000-0000-000000000000"
    },
    {
      description          = "Example - Azure RBAC permision on Resource"
      scope                = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM"
      role_definition_name = "Contributor"
      principal_id         = "00000000-0000-0000-0000-000000000000"
    },
    {
      description          = "Example - Azure RBAC permision on Management Group"
      scope                = "/providers/Microsoft.Management/managementGroups/myMG"
      role_definition_name = "Contributor"
      principal_id         = "00000000-0000-0000-0000-000000000000"
    }
  ]
  description = "Azure RBAC role assignment (permissions) configuration."
}