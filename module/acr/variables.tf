variable "acr_name" {
  type = string
  description = "The name of the Azure Container Registry"
}
variable "location" {
  type = string
  description = "The location where resources will be created"
}
variable "resource_group_name" {
  type = string
  description = "The name of the resource group"
}
variable "aks_cluster_name" {
  type = string
  description = "The name of the Azure Kubernetes Service cluster"
}