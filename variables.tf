variable "vnet_name" {
  type = string
  description = "The name of the VNet"
}

variable "location" {
  type = string
  description = "The location where resources will be created"
}
# Resource
variable "k8s_rg_name" {
  description = "The name of the resource group used by k8s."
  default     = "k8sResourceGroup"
}

variable "acr_name" {
  type = string
  description = "The name of the Azure Container Registry"
}

variable "aks_cluster_name" {
  type = string
  description = "The name of the Azure Kubernetes Service cluster"
}