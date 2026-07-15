output "resource_group_name" {
  description = "Name of the created Azure resource group."
  value       = azurerm_resource_group.this.name
}

output "resource_group_id" {
  description = "Azure resource ID of the created resource group."
  value       = azurerm_resource_group.this.id
}

output "resource_group_location" {
  description = "Azure location of the created resource group."
  value       = azurerm_resource_group.this.location
}
