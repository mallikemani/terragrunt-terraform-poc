moved {
  from = azurerm_resource_group.this
  to   = module.resource_group.azurerm_resource_group.this
}

moved {
  from = azurerm_virtual_network.this
  to   = module.network.azurerm_virtual_network.this
}

moved {
  from = azurerm_subnet.this
  to   = module.network.azurerm_subnet.this
}
