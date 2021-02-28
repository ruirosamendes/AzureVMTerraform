data "azurerm_subscription" "current" {

}

data "azurerm_client_config" "current" {

}

locals {
  location = "westeurope"
  tags = {
    "Project" = "VM with Terraform",
    "Scope" = "DEV",    
  }

  subnet_id = format("%s/resourceGroups/%s/providers/Microsoft.Network/virtualNetworks/%s/subnets/%s", data.azurerm_subscription.current.id, "network-rg", "my-vnet", "Frontends")

} 