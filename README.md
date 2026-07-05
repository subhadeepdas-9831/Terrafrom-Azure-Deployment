# Terrafrom-Azure-Deployment

This repository contains a starter setup for Azure infrastructure deployments with Terraform and a custom agent definition for Terraform IaC development.

## GitHub Actions Workflow

The workflow in [.github/workflows/terraform-azure.yml](.github/workflows/terraform-azure.yml) runs only when triggered manually from the GitHub Actions tab.

### Required GitHub secrets

Set these in your repository settings:

- AZURE_CREDENTIAL: the Azure service principal JSON object already configured in your repository
- VM_ADMIN_PASSWORD: a strong password for the VM admin account

## Terraform Example

See [VM Creation](VM%20Creation) for a working starter deployment.

## Next Steps

1. Review the Terraform example in [VM Creation](VM%20Creation).
2. Add the required GitHub secrets.
3. Run the workflow manually from the Actions tab.
