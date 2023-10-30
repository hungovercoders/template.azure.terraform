terraform {


  backend "azurerm" {
    resource_group_name  = TF_VAR_TERRAFORM_BACKEND_RESOURCE_GROUP_NAME
    storage_account_name = TF_VAR_TERRAFORM_BACKEND_STORAGE_ACCOUNT_NAME
    container_name       = TF_VAR_TERRAFORM_BACKEND_STORAGE_ACCOUNT_CONTAINER_NAME
    key                  = "terraform.tfstate"
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
