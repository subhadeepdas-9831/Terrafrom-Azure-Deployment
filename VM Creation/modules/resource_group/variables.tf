variable "name" {
  description = "VM-Creation"
  type        = string
}

variable "location" {
  description = "East US"
  type        = string
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
