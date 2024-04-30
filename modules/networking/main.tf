# ================
#  Normalizd Vars
# ================

locals {
  name = lower(var.name)
}

# ================
# Virtual Network
# ================

resource "azurerm_resource_group" "networking_rg" {
  name     = "${local.name}-${var.env}-networking-rg"
  location = var.location
  tags     = var.default_tags
}


resource "azurerm_virtual_network" "cluster_vnet" {
  name                = "${local.name}-${var.env}-vnet"
  location            = azurerm_resource_group.networking_rg.location
  resource_group_name = azurerm_resource_group.networking_rg.name
  address_space       = var.vnet_address_space
  tags                = var.default_tags
}

# AKS Subnet
# ----------

resource "azurerm_subnet" "aks_nodes" {
  name                 = "aks-nodes-subnet"
  resource_group_name  = azurerm_resource_group.networking_rg.name
  virtual_network_name = azurerm_virtual_network.cluster_vnet.name
  address_prefixes     = var.aks_subnet_address_prefixes
}

resource "azurerm_subnet" "aks_api_server" {
  name                 = "aks-api-server-subnet"
  resource_group_name  = azurerm_resource_group.networking_rg.name
  virtual_network_name = azurerm_virtual_network.cluster_vnet.name
  address_prefixes     = var.aks_api_server_address_prefixes
}

# Static IP for LB
# ----------------

resource "azurerm_public_ip" "ingress" {
  name                = "${local.name}-${var.env}-aks-ingress-ip"
  resource_group_name = azurerm_resource_group.networking_rg.name
  location            = azurerm_resource_group.networking_rg.location
  sku                 = "Standard"
  allocation_method   = "Static"
  tags                = var.default_tags

  # Used in DNS records (managed by another IaC repo)
  lifecycle {
    prevent_destroy = true
  }
}




# ===============
#  Client Config
# ===============

data "azurerm_client_config" "current" {}
