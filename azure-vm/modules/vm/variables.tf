variable "rg_location" {}
variable "rg_name" {}
variable "subnet_id" {}
variable "vm_name" {}
variable "vm_size" {}
variable "admin_username" {}
variable "admin_password" {
  sensitive = true
}
variable "nic_name" {}
variable "tags" {
  type = map(string)
  default = {}
}
variable "availability_zone" { # Added availability zone variable
  type = string
  description = "The availability zone to place the VM in."
}

