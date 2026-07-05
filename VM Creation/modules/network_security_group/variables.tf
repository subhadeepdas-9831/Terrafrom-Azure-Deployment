variable "name" {
  description = "NSG name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "allow_ssh" {
  description = "Enable SSH inbound rule"
  type        = bool
  default     = true
}

variable "ssh_source_address_prefix" {
  description = "Source CIDR for SSH"
  type        = string
  default     = "*"
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
