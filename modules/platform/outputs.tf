output "resource_group_name" {
  description = "Name of the created Azure resource group."
  value       = module.resource_group.name
}

output "resource_group_id" {
  description = "Azure resource ID of the created resource group."
  value       = module.resource_group.id
}

output "resource_group_location" {
  description = "Azure location of the created resource group."
  value       = module.resource_group.location
}

output "virtual_network_id" {
  description = "Azure resource ID of the virtual network."
  value       = module.network.id
}

output "virtual_network_name" {
  description = "Name of the virtual network."
  value       = module.network.name
}

output "subnet_ids" {
  description = "Map of logical subnet names to Azure subnet resource IDs."
  value       = module.network.subnet_ids
}
