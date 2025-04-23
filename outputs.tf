# Output the raw Kube config (for kubectl access)
output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive = true
}

# Output the cluster host URL
output "host" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host
}

# Output the client certificate (not usually needed manually)
output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_certificate
  sensitive = true
}

# Output the created resource group
output "resource_group_name" {
  value = azurerm_resource_group.aks_rg.name
}
