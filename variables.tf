variable "name" {}
variable "env" {}
variable "location" {}
variable "default_tags" {}

variable "vnet_address_space" {}
variable "reserved_for_aks_service_cidr" {
  type        = string
  description = "Reserved by AKS. Ensure this does not overlap with any of the subnets"
}
variable "aks_subnet_address_prefixes" {}
variable "aks_api_server_address_prefixes" {}
