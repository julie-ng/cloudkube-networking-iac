output "resource_group" {
  value = {
    name     = azurerm_resource_group.networking_rg.name
    location = azurerm_resource_group.networking_rg.location
    tags     = azurerm_resource_group.networking_rg.tags
  }
}

output "virtual_network" {
  value = {
    name          = azurerm_virtual_network.cluster_vnet.name
    address_space = azurerm_virtual_network.cluster_vnet.address_space
  }
}

output "subnets" {
  value = {
    aks_nodes = {
      id               = azurerm_subnet.aks_nodes.id
      address_prefixes = azurerm_subnet.aks_nodes.address_prefixes
      name             = azurerm_subnet.aks_nodes.name
      delegation       = azurerm_subnet.aks_nodes.delegation
      vnet_name        = azurerm_subnet.aks_nodes.virtual_network_name
    }
    aks_api_server = {
      id               = azurerm_subnet.aks_api_server.id
      address_prefixes = azurerm_subnet.aks_api_server.address_prefixes
      name             = azurerm_subnet.aks_api_server.name
      delegation       = azurerm_subnet.aks_api_server.delegation
      vnet_name        = azurerm_subnet.aks_api_server.virtual_network_name
    }
  }
}
