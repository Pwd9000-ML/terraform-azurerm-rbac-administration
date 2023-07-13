# client config
data "azuread_client_config" "current" {}

# Data source to retrieve User object IDs to add as AAD group owners
data "azuread_users" "GroupOwners" {
  user_principal_names = var.groupOwners
  ignore_missing       = true
}

# Data source to retrieve resource group object ID
data "azurerm_resource_group" "rbac" {
  name = var.resourceGroupName
}

# data source to retrieve key vault object
data "azurerm_key_vault" "rbac" {
  name                = var.keyVaultName
  resource_group_name = var.resourceGroupName
}