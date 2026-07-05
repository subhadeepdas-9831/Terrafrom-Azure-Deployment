variable "disk_count" {
  description = "Number of managed disks"
  type        = number
}

variable "disk_size_gb" {
  description = "Managed disk size in GB"
  type        = number
}

variable "storage_account_type" {
  description = "Storage account type for managed disks"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "name_prefix" {
  description = "Prefix used for disk names"
  type        = string
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
