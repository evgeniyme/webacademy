terraform {
  backend "azurerm" {
    resource_group_name  = "tf-state-rg"
    storage_account_name = "tfstateev"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}