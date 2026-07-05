# Azure VM Terraform Example

This folder contains a modular Terraform example for provisioning an Azure Linux VM with:

- a separate resource group module
- a separate NSG module
- optional additional managed disks

## Prerequisites

- Terraform v1.5 or newer
- Azure CLI installed and authenticated
- An Azure subscription

## Authentication

```bash
az login
az account set --subscription "<subscription-id>"
```

## Usage

1. Copy the example variables file:

```bash
cp terraform.tfvars.example terraform.tfvars
```

2. Update the values in terraform.tfvars.

3. Initialize Terraform:

```bash
terraform init
```

4. Review the plan:

```bash
terraform plan -var-file="terraform.tfvars"
```

5. Apply the configuration:

```bash
terraform apply -var-file="terraform.tfvars"
```

## Module Structure

- modules/resource_group: creates the resource group
- modules/network_security_group: creates the NSG and SSH rule
- modules/extra_disk: creates additional managed disks

## Notes

- The VM uses password authentication for simplicity.
- For production, prefer SSH keys and tighter network rules.
- Replace the sample SSH source CIDR with your own IP address.
