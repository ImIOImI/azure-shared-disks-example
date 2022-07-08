resource "azurerm_network_interface" "main" {
  count               = local.vm_count
  name                = "${var.prefix}-nic-${count.index}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "compute" {
  count                 = local.vm_count
  name                  = "${local.vm_name}-${count.index}"
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.main[count.index].id]
  vm_size               = local.vm_size

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
  }

  os_profile {
    computer_name  = "${local.vm_name}-${count.index}"
    admin_username = local.admin-username
    admin_password = local.admin-password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_managed_disk" "example" {
  name                 = "${local.vm_name}-disk1"
  location             = azurerm_resource_group.example.location
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = local.replication
  create_option        = "Empty"
  disk_size_gb         = local.disk-size
  max_shares           = local.vm_count
  tier                 = local.tier
}

resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  count              = local.vm_count
  managed_disk_id    = azurerm_managed_disk.example.id
  virtual_machine_id = azurerm_virtual_machine.compute[count.index].id
  lun                = "10"
  caching            = "None" //no caching is allowed on shared drives
}
