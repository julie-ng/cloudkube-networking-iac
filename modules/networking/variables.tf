variable "name" {
  type        = string
  description = "A base name used for all resources in this project (incl. dashes). Required."

  validation {
    condition     = length(var.name) < 20
    error_message = "Name must be less than 20 characters."
  }
}

variable "env" {
  type        = string
  description = "String used in all the naming conventions for TLS, DNS, etc."
  validation {
    condition     = contains(["dev", "staging", "prod"], var.env)
    error_message = "Must be one of 'dev', 'staging' or 'prod'."
  }
}

variable "location" {
  type        = string
  description = "Location used for all resources in this project. Defaults to 'Central US'"
  default     = "Central US"
}

variable "default_tags" {
  type = map(string)
  default = {
    demo   = "true"
    public = "true"
  }
}

# Networking (Azure)
# ------------------

variable "vnet_address_space" {
  type = list(string)
}

variable "aks_nodes_address_prefixes" {
  type = list(string)
}

variable "aks_api_server_address_prefixes" {
  type = list(string)
}

variable "reserved_k8s_service_address_range" {
  type = string
}

variable "reserved_k8s_dns_ip" {
  type = string
}
