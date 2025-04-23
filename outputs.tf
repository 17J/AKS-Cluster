output "kube_config" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive = true
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_certificate
  sensitive = true
}

output "host" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host
}

output "resource_group_name" {
  value = azurerm_resource_group.aks_rg.name
}
