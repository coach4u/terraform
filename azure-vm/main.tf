terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
       version = ">= 3.75.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id=""
  resource_provider_registrations = "none"
}

module "network" {
  source         = "./modules/vnet"
  rg_name        = var.existing_resource_group_name
  rg_location    = var.location
  vnet_name      = var.virtual_network_name
  vnet_cidr      = var.vnet_address_space
  subnets        = var.subnets
  tags           = var.common_tags
}

module  "vm1" { 
  source           = "./modules/vm"
  rg_name          = var.existing_resource_group_name
  rg_location      = var.location
  subnet_id        = module.network.subnet_ids["public-subnet-1"] 
  vm_name          = "my-vm-1"
  vm_size          = var.vm_size
  admin_username   = var.admin_username
  admin_password   = var.admin_password
  nic_name         = "${var.vm_hostname}-nic-1" 
  tags             = var.common_tags
  availability_zone = "1" # Added availability zone
}

module  "vm2" { 
  source           = "./modules/vm"
  rg_name          = var.existing_resource_group_name
  rg_location      = var.location
  subnet_id        = module.network.subnet_ids["public-subnet-2"]
  vm_name          = "my-vm-2"
  vm_size          = var.vm_size
  admin_username   = var.admin_username
  admin_password   = var.admin_password
  nic_name         = "${var.vm_hostname}-nic-2" 
  tags             = var.common_tags
  availability_zone = "2" # Added availability zone
}
