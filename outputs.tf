output "resource_group" {
  value = module.network.resource_group.name
}

output "virtual_network" {
  value = module.network.virtual_network
}

output "subnets" {
  value = module.network.subnets
}

output "ip_address_plan" {
  value = {
    virtual_network = module.network.virtual_network.address_space[0]
    subnets = {
      aks_nodes_subnet      = module.network.subnets.aks_nodes.address_prefixes[0]
      k8s_api_server_subnet = module.network.subnets.aks_api_server.address_prefixes[0]
    }
    reserved = {
      k8s_service_address_range = var.reserved_k8s_service_address_range
      k8s_dns_ip                = var.reserved_k8s_dns_ip
      note                      = "Do not create subnets, resources in this range."
    }
  }
}
