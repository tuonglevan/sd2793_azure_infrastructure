# Resource
module "ResourceGroup" {
  source = "./module/resource_group"
  location = var.location
  k8s_rg_name = var.k8s_rg_name
}

# Security
module "security" {
  source = "./module/security"
  location = var.location
  resource_group_name = module.ResourceGroup.k8s_resource_name
  vnet_name = var.vnet_name
}

# Networking
module "networking" {
  source = "./module/networking"
  vnet_name = var.vnet_name
  location = var.location
  resource_group_name = module.ResourceGroup.k8s_resource_name
  app_subnet_nsg_id = module.security.app_subnet_nsg_id
}

# ACR
module "acr" {
  source = "./module/acr"
  aks_cluster_name = module.aks.aks_cluster_name
  acr_name = var.acr_name
  location = var.location
  resource_group_name = module.ResourceGroup.k8s_resource_name
}
# AKS
module "aks" {
  source = "./module/aks"
  location = var.location
  resource_group_name = module.ResourceGroup.k8s_resource_name
  aks_cluster_name = var.aks_cluster_name
  aks_subnet_id = module.networking.aks_subnet_id
  acr_id = module.acr.acr_id
}