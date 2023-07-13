###Resource Group###
variable "resourceGroupName" {
  type        = string
  default     = "existing-rg-name"
  description = "Name of the resource group where resources are hosted."
  nullable    = false
}

###Key Vault###
variable "keyVaultName" {
  type        = string
  default     = "existing-kv-name"
  description = "Name of the key vault."
  nullable    = false
}

###AAD Groups###
variable "aadGroup" {
  type        = string
  default     = "AAD-group-to-create"
  description = "The name of the AAD group that will be created."
}

###AAD Group Owners (Data Source)###
variable "groupOwners" {
  type        = list(string)
  default     = ["aadGroupOwner@company.com"]
  description = "The names of the of the users that will be added as owners to the AD groups."
}

###Rbac configuration###
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
  description = "Azure RBAC permision configuration"
}