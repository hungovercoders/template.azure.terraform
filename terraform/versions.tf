terraform {


  backend "azurerm" {
    resource_group_name  = "state-rg"
    storage_account_name = "lrnstateeunhngc"
    container_name       = "learning"
    key                  = "template.azure.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.62.1"
    }
  }

  required_version = ">= 1.2.3"

}

provider "azurerm" {
  features {}
}
