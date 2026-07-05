output "resource_group_name" {
  description = "Name of the deployed resource group"
  value       = module.resource_group.name
}

output "virtual_machine_id" {
  description = "ID of the Azure Linux VM"
  value       = azurerm_linux_virtual_machine.this.id
}

output "public_ip_address" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.this.ip_address
}

output "network_security_group_id" {
  description = "ID of the NSG"
  value       = module.network_security_group.id
}

output "additional_disk_ids" {
  description = "IDs of the additional managed disks"
  value       = var.additional_disk_count > 0 ? [for disk in values(module.additional_disks[0].managed_disks) : disk.id] : []
}
