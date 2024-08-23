variable "vnet_name" {
  type = string
  description = "The name of the VNet"
}

variable "location" {
  type = string
  description = "The location where resources will be created"
}

variable "resource_group_name" {
  type = string
  description = "The name of the resource group"
}

variable "vnet_address_space" {
  description = "The address space for the VNet"
  default     = ["10.0.0.0/16"]
}

variable "aks_subnet_prefix" {
  description = "The address prefix for the AKS subnet"
  default     = "10.0.1.0/24"
}

variable "app_subnet_nsg_id" {
  type = string
}