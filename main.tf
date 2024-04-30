module "network" {
  source       = "./modules/networking"
  name         = var.name
  env          = var.env
  location     = var.location
  default_tags = var.default_tags

  vnet_address_space              = var.vnet_address_space
  aks_nodes_address_prefixes      = var.aks_nodes_address_prefixes
  aks_api_server_address_prefixes = var.aks_api_server_address_prefixes

  reserved_k8s_service_address_range = var.reserved_k8s_service_address_range
  reserved_k8s_dns_ip                = var.reserved_k8s_dns_ip
}
