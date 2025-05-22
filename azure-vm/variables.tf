variable "location" {
  default     = "eastus"
  description = "The Azure region to deploy resources into."

}

variable "existing_resource_group_name" {
  type        = string
  description = "The name of the existing Azure Resource Group."
}

variable "virtual_network_name" {
  default     = "my-vnet"
  description = "The name of the Virtual Network."
}

variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
  description = "The CIDR block for the Virtual Network."
}

variable "subnets" {
  type = map(object({
    address_prefix = string
  }))
  default = {
    "public-subnet-1" = { address_prefix = "10.0.10.0/24" }
    "public-subnet-2" = { address_prefix = "10.0.20.0/24" }
    "private-subnet-1" = { address_prefix = "10.0.30.0/24" }
    "private-subnet-2" = { address_prefix = "10.0.40.0/24" }
  }
  description = "Map of subnets to create.  Key is subnet name, value is { address_prefix = cidr }"
}

variable "vm_hostname" {
  default     = "my-vm"
  description = "The hostname prefix for the Virtual Machines."
}

variable "vm_size" {
  default     = "Standard_DS1_v2"
  description = "The size of the Virtual Machines."
}

variable "admin_username" {
  description = "The administrator username for the Virtual Machines."
}

variable "admin_password" {
  type        = string
  description = "The administrator password for the Virtual Machines.  MUST be strong."
  sensitive   = true
}

variable "common_tags" {
  type = map(string)
  default = {
    environment = "dev"
    project     = "simple-setup"
  }
  description = "A map of tags to apply to all resources."
}

