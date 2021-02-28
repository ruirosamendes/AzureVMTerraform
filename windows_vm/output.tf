output "vm" {
  description = "The Virtual Machine created."
  value = azurerm_virtual_machine.vm
}

output "vm_nic" {
  description = "The Virtual Machine network interface created."
  value =  azurerm_network_interface.vm_nic
}
