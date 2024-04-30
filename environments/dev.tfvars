env                             = "dev"
vnet_address_space              = ["10.0.0.0/16"]
aks_nodes_address_prefixes      = ["10.0.4.0/22"]
aks_api_server_address_prefixes = ["10.0.8.0/24"]

reserved_k8s_service_address_range = "10.0.0.0/22"
reserved_k8s_dns_ip                = "10.0.0.2"
