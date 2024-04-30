module "network" {
  source       = "./modules/networking"
  name         = var.name
  env          = var.env
  location     = var.location
  default_tags = var.default_tags

  vnet_address_space              = var.vnet_address_space
  aks_subnet_address_prefixes     = var.aks_subnet_address_prefixes
  aks_api_server_address_prefixes = var.aks_api_server_address_prefixes
}
