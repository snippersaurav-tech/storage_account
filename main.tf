terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.74.0"
    }
  }
}

provider "azurerm" {
  features {}
} 
# terraform 2-04-2026

resource "azurerm_resource_group" "kumar3" {
  name     = "rg-kumar3"
  location = "West Europe"
}
resource "azurerm_storage_account" "kumar3" {
  depends_on = [ azurerm_resource_group.kumar3 ]
  name                     = "storagedemo12345"
  resource_group_name      = azurerm_resource_group.kumar3.name
  location                 = azurerm_resource_group.kumar3.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}