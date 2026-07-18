output "resource_group_name" {
  description = "Resource group containing the backend."
  value       = azurerm_resource_group.this.name
}

output "storage_account_name" {
  description = "Storage account containing Terraform state."
  value       = azurerm_storage_account.this.name
}

output "storage_account_id" {
  description = "Azure resource ID of the backend storage account."
  value       = azurerm_storage_account.this.id
}

output "container_name" {
  description = "Blob container containing Terraform state."
  value       = azurerm_storage_container.this.name
}
