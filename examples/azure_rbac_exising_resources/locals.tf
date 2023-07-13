locals {
  azure_rbac_config = [
    {
      description          = "Example - Azure RBAC permision on existing Resource Group"
      scope                = data.azurerm_resource_group.rbac.id
      role_definition_name = "Contributor"
      principal_id         = azuread_group.rbac.id
    },
    {
      description          = "Example - Azure RBAC permision on existing KeyVault"
      scope                = data.azurerm_key_vault.rbac.id
      role_definition_name = "key vault Contributor"
      principal_id         = azuread_group.rbac.id
    }
  ]
}