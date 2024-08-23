output "vnet_id" {
  value = module.networking.vnet_id
}
# Security
output "security" {
  value = module.security.app_subnet_nsg_id
}
# Resource Group
output "ResourceGroup" {
  value = {
    k8s_rg_name: module.ResourceGroup.k8s_resource_name
  }
}
# ACR
output "acr" {
  value = {
    login_server: module.acr.acr_login_server,
    name: module.acr.acr_name
  }
}
# AKS
output "aks" {
  value = {
    client_certificate: module.aks.client_certificate
    kube_config: module.aks.kube_config
  }
  sensitive = true
}