###Common###
variable "tags" {
  type = map(string)
  default = {
    Terraform   = "True"
    Description = "Automated test for RBAC administration module."
    Author      = "Marcel Lupo"
    GitHub      = "https://registry.terraform.io/modules/Pwd9000-ML/rbac-administration/azurerm/latest"
  }
  description = "A map of key value pairs that is used to tag resources created."
}

variable "location" {
  type        = string
  default     = "uksouth"
  description = "Azure region to deploy resources to."
}

###Resource Group###
variable "resource_group_name" {
  type        = string
  default     = "resource-group-name-to-create"
  description = "Name of the resource group where resources will be hosted."
  nullable    = false
}

###key vault###
variable "kv_config" {
  type = object({
    name = string
    sku  = string
  })
  default = {
    name = "rbactestkv"
    sku  = "standard"
  }
  description = "Key Vault configuration object to create azure key vault."
  nullable    = false
}

variable "kv_net_rules" {
  type = list(object({
    default_action             = string
    bypass                     = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  }))
  default = [{
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = ["0.0.0.0/0"] #for testing purposes only - allow all IPs
    virtual_network_subnet_ids = []
  }]
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