resource "azurerm_role_assignment" "rbac" {
  for_each             = { for each in var.azure_rbac_config : each.description => each }
  description          = each.value.description
  scope                = each.value.scope
  role_definition_name = each.value.role_definition_name
  principal_id         = each.value.principal_id
}