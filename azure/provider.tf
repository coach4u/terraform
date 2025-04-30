terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.35.0"
    }
  }
}


provider "azurerm" {
    features{}
    subscription_id=""
    resource_provider_registrations = "none"

}

