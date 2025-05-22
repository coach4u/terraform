variable "rg_location" {}
variable "rg_name" {}
variable "vnet_name" {}
variable "vnet_cidr" {
  type = list(string)
}
variable "tags" {
  type = map(string)
  default = {}
}

variable "subnets" {
  type = map(object({
    address_prefix = string,
  }))
  description = "Map of subnets to create.  Key is subnet name, value is { address_prefix = cidr }"
}

