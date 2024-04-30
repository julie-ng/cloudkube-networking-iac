variable "name" {}
variable "env" {}
variable "location" {}
variable "default_tags" {}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for entire virtual network"
}

variable "aks_nodes_address_prefixes" {
  type        = list(string)
  description = "Subnet address range for AKS Nodes"
}

variable "aks_api_server_address_prefixes" {
  type        = list(string)
  description = "Subnet address range for Kubernetes API Server"
}

variable "reserved_k8s_service_address_range" {
  type        = string
  description = "Reserved by AKS. Ensure this does not overlap with any of the subnets"
}

variable "reserved_k8s_dns_ip" {
  type        = string
  description = "Must be in k8s service reserved address range, but not the first IP address."
}
