output "resource_group" {
  value = module.network.resource_group.name
}

output "virtual_network" {
  value = module.network.virtual_network
}

output "subnets" {
  value = module.network.subnets
}

output "cidrs" {
  value = {
    _0_vnet_address_space            = module.network.virtual_network.address_space[0]
    _1_reserved_for_aks_service_cidr = var.reserved_for_aks_service_cidr
    _2_aks_nodes_subnet              = module.network.subnets.aks_nodes.address_prefixes[0]
    _3_aks_api_server_subnet         = module.network.subnets.aks_api_server.address_prefixes[0]
  }
}
