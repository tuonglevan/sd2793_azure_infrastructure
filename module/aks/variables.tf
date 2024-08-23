variable "aks_cluster_name" {
  type = string
  description = "The name of the Azure Kubernetes Service cluster"
}
variable "location" {
  type = string
  description = "The location where resources will be created"
}
variable "resource_group_name" {
  type = string
  description = "The name of the resource group"
}
variable "aks_subnet_id" {
  description = "The ID of the subnet where the Azure Kubernetes Service (AKS) nodes will be deployed"
  type        = string
}
variable "acr_id" {
  description = "The ID of the Azure Container Registry"
  type        = string
}
