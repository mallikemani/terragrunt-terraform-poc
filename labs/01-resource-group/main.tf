locals {
  resource_tags = merge(
    var.common_tags,
    {
      environment = var.environment
    }
  )
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.resource_tags
}
