locals {
  azure_rbac_config = [
    {
      description          = "Example - Azure RBAC permision on Resource Group"
      scope                = azurerm_resource_group.rg.id
      role_definition_name = "Contributor"
      principal_id         = data.azurerm_client_config.current.object_id
    },
    {
      description          = "Example - Azure RBAC permision on KeyVault"
      scope                = azurerm_key_vault.kv.id
      role_definition_name = "key vault Contributor"
      principal_id         = data.azurerm_client_config.current.object_id
    }
  ]
}