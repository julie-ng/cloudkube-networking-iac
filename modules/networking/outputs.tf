output "resource_group" {
  value = {
    name     = azurerm_resource_group.networking_rg.name
    location = azurerm_resource_group.networking_rg.location
  }
}

output "virtual_network" {
  value = {
    name          = azurerm_virtual_network.cluster_vnet.name
    address_space = azurerm_virtual_network.cluster_vnet.address_space
    subnet        = azurerm_virtual_network.cluster_vnet.subnet
  }
}
