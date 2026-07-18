variable "subscription_id" {
  description = "Azure subscription containing the Terraform backend."
  type        = string
}

variable "location" {
  description = "Azure region for the backend resources."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Resource group containing the Terraform backend."
  type        = string
  default     = "rg-terraform-state-eastus"
}

variable "container_name" {
  description = "Blob container used for Terraform state."
  type        = string
  default     = "tfstate"
}
