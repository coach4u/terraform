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
    subscription_id="9734ed68-621d-47ed-babd-269110dbacb1"
    resource_provider_registrations = "none"

}

