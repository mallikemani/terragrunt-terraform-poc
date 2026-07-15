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
