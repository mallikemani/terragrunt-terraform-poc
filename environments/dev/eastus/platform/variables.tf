variable "subscription_id" {
  description = "Azure subscription in which resources will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Azure resource group."
  type        = string

  validation {
    condition     = length(var.resource_group_name) >= 3
    error_message = "The resource group name must contain at least three characters."
  }
}

variable "location" {
  description = "Azure region in which resources will be deployed."
  type        = string
}

variable "environment" {
  description = "Deployment environment, such as dev, test, or prod."
  type        = string

  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "The environment must be dev, test, or prod."
  }
}

variable "common_tags" {
  description = "Common tags applied to resources."
  type        = map(string)

  default = {
    managed_by = "terraform"
    project    = "terragrunt-terraform-poc"
  }
}

variable "virtual_network_name" {
  description = "Name of the Azure virtual network."
  type        = string
}

variable "virtual_network_address_space" {
  description = "Address spaces assigned to the virtual network."
  type        = list(string)

  validation {
    condition     = length(var.virtual_network_address_space) > 0
    error_message = "At least one virtual network address space must be supplied."
  }
}

variable "subnets" {
  description = "Subnets that should be created inside the virtual network."

  type = map(object({
    address_prefixes = list(string)
  }))

  validation {
    condition     = length(var.subnets) > 0
    error_message = "At least one subnet must be supplied."
  }
}
