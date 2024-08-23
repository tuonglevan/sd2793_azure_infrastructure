# Terraform Azure Infrastructure Deployment

This repository contains Terraform scripts for deploying infrastructure on Azure. The setup includes configuring resources such as Virtual Network (VNet), Azure Kubernetes Service (AKS), Azure Container Registry (ACR), and more.

## Prerequisites

Before you begin, ensure you have the following prerequisites:

- **Terraform**: Ensure that Terraform is installed on your local machine. [Install Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
- **Azure CLI**: Ensure that the Azure CLI is installed on your local machine. [Install Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- **Azure Subscription**: You need an active Azure subscription.

## Authentication

Authenticate with your Azure account using the Azure CLI:

```bash
az login
```

This command will open your default web browser and prompt you to enter your Azure credentials.

## Configuration


### 1. Set Variables

The following variables can be configured in the Terraform scripts:

- **location**: The location where resources will be created (e.g., `Southeast Asia`).
- **vnet_name**: The name of the Virtual Network (VNet).
- **k8s_rg_name**: The K8s of the resource group.
- **acr_name**: The base name for the Azure Container Registry.
- **aks_name**: The name of the Azure Kubernetes Service cluster.

## Running the Terraform Scripts

1. **Initialize Terraform**:
   ```bash
   terraform init
   ```

2. **Validate the Configuration**:
   ```bash
   terraform validate
   ```

3. **Plan the Deployment**:
   ```bash
   terraform plan -auto-approve -var-file "terraform.tfvars"
   ```

4. **Apply the Deployment**:
   ```bash
   terraform apply -auto-approve -var-file "terraform.tfvars"
   ```

## Outputs

The following outputs will be provided after deploying the infrastructure:

```hcl
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
```

## Cleaning Up

To destroy the infrastructure, run:
```bash
terraform destroy -auto-approve -var-file "terraform.tfvars"
```

## Contributing

Contributions are welcome! Please feel free to submit a PR or open an issue.