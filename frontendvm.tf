
// Web Application Servers
resource "azurerm_resource_group" "vm" {
  name = "terraform-vm-rg"
  location = local.location
  tags = local.tags
}

// VM zone 1
module "frontendvm1" {
  source = "./windows_vm"
  location                = local.location    
  resource_group_name     = azurerm_resource_group.vm.name
  subnet_id               = local.subnet_id 
  private_ip              = "10.0.0.37"
  name                    = "frontendsrv-vm"    
  size                    = "Standard_B4ms"  
  os_computer_name        = "frontendsrv1" 
  os_admin_username       = "adminuser"
  os_admin_password       = "Pa$$w0rd1234"
  os_disk_sku             = "StandardSSD_LRS"    
  data_disk_sku           = "StandardSSD_LRS"  
  data_disk_size          = "128"  
  zones                   = [1]
  tags                    = local.tags
}