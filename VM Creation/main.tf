locals {
  common_tags = merge(
    {
      Environment = var.environment
      ManagedBy   = "Terraform"
      Project     = "Azure VM Demo"
    },
    var.tags
  )
}

module "resource_group" {
  source = "./modules/resource_group"

  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

module "network_security_group" {
  source = "./modules/network_security_group"

  name                     = var.nsg_name
  resource_group_name      = module.resource_group.name
  location                 = var.location
  allow_ssh                = var.allow_ssh
  ssh_source_address_prefix = var.ssh_source_address_prefix
  tags                     = local.common_tags
}

resource "azurerm_virtual_network" "this" {
  name                = "${var.vm_name}-vnet"
  location            = var.location
  resource_group_name = module.resource_group.name
  address_space       = [var.vnet_address_space]
  tags                = local.common_tags
}

resource "azurerm_subnet" "this" {
  name                 = "${var.vm_name}-subnet"
  resource_group_name  = module.resource_group.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.subnet_address_prefix]
}

resource "azurerm_public_ip" "this" {
  name                = "${var.vm_name}-pip"
  location            = var.location
  resource_group_name = module.resource_group.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = local.common_tags
}

resource "azurerm_network_interface" "this" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = local.common_tags

  ip_configuration {
    name                          = "primary"
    subnet_id                     = azurerm_subnet.this.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this.id
  }
}

resource "azurerm_network_interface_security_group_association" "this" {
  network_interface_id      = azurerm_network_interface.this.id
  network_security_group_id = module.network_security_group.id
}

module "additional_disks" {
  count = var.additional_disk_count > 0 ? 1 : 0

  source = "./modules/extra_disk"

  disk_count           = var.additional_disk_count
  disk_size_gb         = var.additional_disk_size_gb
  storage_account_type = var.additional_disk_storage_account_type
  location             = var.location
  resource_group_name  = module.resource_group.name
  name_prefix          = var.vm_name
  tags                 = local.common_tags
}

resource "azurerm_linux_virtual_machine" "this" {
  name                            = var.vm_name
  resource_group_name             = module.resource_group.name
  location                        = var.location
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.this.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  dynamic "storage_data_disk" {
    for_each = var.additional_disk_count > 0 ? module.additional_disks[0].managed_disks : {}
    content {
      name              = storage_data_disk.value.name
      managed_disk_id   = storage_data_disk.value.id
      create_option     = "Attach"
      lun               = tonumber(storage_data_disk.key)
      caching           = "ReadWrite"
    }
  }

  tags = local.common_tags
}
