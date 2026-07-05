output "managed_disks" {
  description = "Managed disks created by the module"
  value       = azurerm_managed_disk.this
}
