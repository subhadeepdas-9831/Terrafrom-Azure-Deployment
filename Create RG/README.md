# Simple Azure Resource Group Terraform Example

This folder contains a minimal Terraform configuration that creates an Azure resource group.

## Usage

Initialize Terraform with the Azure Storage backend:

```bash
terraform init \
  -backend-config="resource_group_name=rg-terraform-state" \
  -backend-config="storage_account_name=cloudshell05062026" \
  -backend-config="container_name=stgterraformstatefile" \
  -backend-config="key=terraform.tfstate"
```

Then plan and apply:

```bash
terraform plan -var="resource_group_name=rg-terraform-demo"
terraform apply -var="resource_group_name=rg-terraform-demo"
```
