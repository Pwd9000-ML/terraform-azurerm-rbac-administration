output "role_assignment_ids" {
  value       = toset([for each in azurerm_role_assignment.rbac : each.id])
  description = "The Role Assignment IDs."
}