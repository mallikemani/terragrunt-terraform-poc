include "root" {
  path = find_in_parent_folders("root.hcl")
}

locals {
  environment_config = read_terragrunt_config(
    find_in_parent_folders("environment.hcl")
  )

  region_config = read_terragrunt_config(
    find_in_parent_folders("region.hcl")
  )

  environment = local.environment_config.locals.environment
  location    = local.region_config.locals.location
}

terraform {
  source = "${get_path_to_repo_root()}//modules/platform"
}

inputs = {
  subscription_id = get_env("ARM_SUBSCRIPTION_ID")

  resource_group_name = "rg-terragrunt-poc-${local.environment}-${local.location}"
  location            = local.location
  environment         = local.environment

  virtual_network_name = "vnet-terragrunt-poc-${local.environment}-${local.location}"

  virtual_network_address_space = (
    local.environment_config.locals.virtual_network_address_space
  )

  subnets = local.environment_config.locals.subnets

  common_tags = {
    managed_by = "terraform"
    project    = "terragrunt-terraform-poc"
  }
}
