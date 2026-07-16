output "id" {
  description = "Azure resource ID of the virtual network."
  value       = azurerm_virtual_network.this.id
}

output "name" {
  description = "Name of the virtual network."
  value       = azurerm_virtual_network.this.name
}

output "subnet_ids" {
  description = "Map of logical subnet names to Azure subnet IDs."

  value = {
    for subnet_name, subnet in azurerm_subnet.this :
    subnet_name => subnet.id
  }
}
