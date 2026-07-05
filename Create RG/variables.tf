variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-terraform-demo"
}

variable "location" {
  description = "Azure region for the resource group"
  type        = string
  default     = "eastus"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}
