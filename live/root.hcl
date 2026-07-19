locals {
  # For a child path such as:
  # dev/eastus/platform
  #
  # path_parts becomes:
  # ["dev", "eastus", "platform"]

  relative_path = path_relative_to_include()
  path_parts    = split("/", local.relative_path)

  environment = local.path_parts[0]
  component   = local.path_parts[length(local.path_parts) - 1]
}

# Terragrunt 1.x defaults to OpenTofu.
# This POC explicitly uses Terraform.
terraform_binary = "terraform"

terragrunt_version_constraint = ">= 1.1.0, < 2.0.0"
terraform_version_constraint  = "~> 1.15.0"

remote_state {
  backend = "azurerm"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    resource_group_name  = "rg-terraform-state-eastus"
    storage_account_name = "sttgpocab0390eb93e0"
    container_name       = "tfstate"

    # Produces:
    # poc/dev/platform.tfstate
    # poc/prod/platform.tfstate
    key = "poc/${local.environment}/${local.component}.tfstate"

    use_azuread_auth = true
    use_cli          = true

    subscription_id = get_env("ARM_SUBSCRIPTION_ID")
    tenant_id       = get_env("ARM_TENANT_ID")
  }
}
