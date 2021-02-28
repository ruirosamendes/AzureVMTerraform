variable "location" {
  description = "Azure region where the resources will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group where the vm resources will be deployed"
  type        = string
}

variable "subnet_id" {
  type        = string
}

variable "private_ip" {
  description = "Static private IP to be assigned to the VM"
  type        = string
}

variable "name" {
  description = "Name of the the virtual machine"
  type        = string
}

variable "size" {
  description = "Specifies the size of the vm: https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sizes?toc=%2Fazure%2Fvirtual-machines%2Fwindows%2Ftoc.json"
  type        = string
}

variable "os_computer_name" {
  description = "(Required) Specifies the name of the local administrator account."
  type        = string
}

variable "os_admin_username" {
  description = "(Required) Specifies the name of the local administrator account."
  type        = string
}

variable "os_admin_password" {
  description = "(Required) The password associated with the local administrator account."
  type        = string
}

variable "os_disk_sku" {
  description = "The type of storage to use for the OS managed disk. Possible values are Standard_LRS, Premium_LRS, StandardSSD_LRS or UltraSSD_LRS"
  type        = string
}

variable "data_disk_sku" {
  description = "The type of storage to use for the data managed disk. Possible values are Standard_LRS, Premium_LRS, StandardSSD_LRS or UltraSSD_LRS"
  type        = string
  default     = null
}

variable "data_disk_size" {
  description = "Specifies the size of the managed disk to create in gigabytes"
  type        = string
  default     = null
}

variable "zones" {
  description   = "(Optional) A list of a single item of the Availability Zone which the Virtual Machine should be allocated in."
  type          = list(string)
}

variable "tags" {
  description   = "Optional block of tags linked to the Resource Group."
  type          = map(string)
}



