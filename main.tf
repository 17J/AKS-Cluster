# Resource Group
resource "azurerm_resource_group" "aks_rg" {
  name     = "devops17-rg"
  location = var.location
}

# Virtual Network for AKS
resource "azurerm_virtual_network" "aks_vnet" {
  name                = "devops17-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
}

# Subnet for AKS Node Pool
resource "azurerm_subnet" "aks_subnet" {
  name                 = "devops17-subnet"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# AKS Cluster with System Assigned Identity
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "devops17-aks"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "devops17"

  default_node_pool {
    name            = "default"
    node_count      = 3
    vm_size         = "Standard_DS2_v2"
    vnet_subnet_id  = azurerm_subnet.aks_subnet.id
    node_labels     = {
      environment = "dev"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  linux_profile {
    admin_username = "azureuser"

    ssh_key {
      key_data = var.ssh_public_key
    }
  }

  tags = {
    Environment = "Dev"
    Owner       = "Terraform"
  }
}
