resource "azurerm_managed_disk" "this" {
  for_each = toset([for i in range(var.disk_count) : tostring(i)])

  name                 = "${var.name_prefix}-disk-${each.value}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
  tags                 = var.tags
}
