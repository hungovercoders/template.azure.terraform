terraform {


  backend "azurerm" {
    resource_group_name  = "state-rg"
    storage_account_name = "stateeundgrf"
    container_name       = "state"
    key                  = "terraform.tfstate"

    client_id       = AZURE_CLIENT_ID
    client_secret   = "25H8Q~jXKA6TekZUzSPv7TR3KZA.Q4vd1F0bFbc2"
    tenant_id       = "2f9c669b-996b-42d4-8bb2-e94d28032233"
    subscription_id = "829dab70-6cf8-487b-b8ca-ec74ab3ffbd8"
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
