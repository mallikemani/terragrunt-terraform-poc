variable "resource_group_name" {
  description = "Resource group containing the virtual network."
  type        = string
}

variable "location" {
  description = "Azure region for the virtual network."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the Azure virtual network."
  type        = string
}

variable "address_space" {
  description = "Address spaces assigned to the virtual network."
  type        = list(string)

  validation {
    condition     = length(var.address_space) > 0
    error_message = "At least one virtual-network address space must be supplied."
  }
}

variable "environment" {
  description = "Deployment environment used in subnet naming."
  type        = string
}

variable "subnets" {
  description = "Subnets created inside the virtual network."

  type = map(object({
    address_prefixes = list(string)
  }))

  validation {
    condition     = length(var.subnets) > 0
    error_message = "At least one subnet must be supplied."
  }
}

variable "tags" {
  description = "Tags applied to the virtual network."
  type        = map(string)
  default     = {}
}
