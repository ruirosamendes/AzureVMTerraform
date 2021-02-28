resource "azurerm_network_interface" "vm_nic" {
  name                = format("%s-nic", var.name)
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "ipconfiguration1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.private_ip
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  = var.name
  location              = var.location
  network_interface_ids = [azurerm_network_interface.vm_nic.id]
  resource_group_name   = var.resource_group_name
  vm_size               = var.size

  os_profile {
    computer_name   =  var.os_computer_name
    admin_username  =  var.os_admin_username    
    admin_password  =  var.os_admin_password
  }

  os_profile_windows_config {
    enable_automatic_upgrades = false
    provision_vm_agent        = true
  }

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = format("%s-osdisk01", var.name)
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.os_disk_sku
  }

  zones = var.zones   
  tags = var.tags

  lifecycle {
    ignore_changes = [os_profile]
  }
}

resource "azurerm_managed_disk" "data_disk" {
  count                 = (var.data_disk_size == null) ? 0 : 1

  name                  = format("%s-datadisk1", var.name)
  create_option         = "Empty"
  location              = var.location
  resource_group_name   = var.resource_group_name
  storage_account_type  = var.data_disk_sku
  disk_size_gb          = var.data_disk_size

  zones = var.zones   

  lifecycle {
    ignore_changes = [encryption_settings]
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attach" {
  count                = (var.data_disk_size == null) ? 0 : 1

  caching             = "ReadWrite"
  lun                 = "1"
  managed_disk_id     = azurerm_managed_disk.data_disk[0].id
  virtual_machine_id  = azurerm_virtual_machine.vm.id
}

