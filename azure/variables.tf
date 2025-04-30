variable "resource_group_name" {
  type    = string
  default = "1-86ce2abb-playground-sandbox"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "vnet_cidr" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnets" {
  type = map(string)
  default = {
    subnet1 = "10.0.1.0/24"
    subnet2 = "10.0.2.0/24"
  }
}

