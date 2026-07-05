variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-terraform-demo"
}

variable "location" {
  description = "Azure region for the deployment"
  type        = string
  default     = "eastus"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "vm_name" {
  description = "Name of the Linux virtual machine"
  type        = string
  default     = "tfvmdemo"
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Administrator username for the VM"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Administrator password for the VM"
  type        = string
  sensitive   = true
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
  default     = "tfvm-nsg"
}

variable "allow_ssh" {
  description = "Whether to allow inbound SSH"
  type        = bool
  default     = true
}

variable "ssh_source_address_prefix" {
  description = "Source CIDR allowed for SSH"
  type        = string
  default     = "*"
}

variable "additional_disk_count" {
  description = "Number of additional managed disks to attach"
  type        = number
  default     = 0
}

variable "additional_disk_size_gb" {
  description = "Size in GB for each additional disk"
  type        = number
  default     = 32
}

variable "additional_disk_storage_account_type" {
  description = "Storage account type for the additional disks"
  type        = string
  default     = "Standard_LRS"
}

variable "tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}
}
