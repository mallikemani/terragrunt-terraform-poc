data "azurerm_client_config" "current" {}

locals {
  # Azure Storage names must be globally unique.
  # MD5 is used only to produce a deterministic naming suffix,
  # not for any security or encryption purpose.
  storage_suffix = substr(
    md5("${var.subscription_id}-${var.location}"),
    0,
    12
  )

  storage_account_name = "sttgpoc${local.storage_suffix}"

  common_tags = {
    environment = "platform"
    managed_by  = "terraform"
    project     = "terragrunt-terraform-poc"
    purpose     = "terraform-state"
  }
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_storage_account" "this" {
  name                = local.storage_account_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
  shared_access_key_enabled       = false
  public_network_access_enabled   = true

  blob_properties {
    versioning_enabled = true

    delete_retention_policy {
      days = 7
    }

    container_delete_retention_policy {
      days = 7
    }
  }

  #  lifecycle {
  #    prevent_destroy = true
  #  }

  tags = local.common_tags
}

resource "azurerm_storage_container" "this" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.this.id
  container_access_type = "private"
}

resource "azurerm_role_assignment" "current_user_blob_access" {
  scope                = azurerm_storage_account.this.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}
