locals {
  resource_tags = merge(
    var.common_tags,
    {
      environment = var.environment
    }
  )
}

module "resource_group" {
  source = "../../modules/resource-group"

  name     = var.resource_group_name
  location = var.location
  tags     = local.resource_tags
}

module "network" {
  source = "../../modules/network"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  virtual_network_name = var.virtual_network_name
  address_space        = var.virtual_network_address_space
  environment          = var.environment
  subnets              = var.subnets
  tags                 = local.resource_tags
}
