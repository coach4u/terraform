variable "region" {
     default= "us-east-1"
}


variable "ami" {
  description = "The AMI to use for the instance"
  type        = map(string)
  default = {
     us-east-1 = "ami-08a0d1e16fc3f61ea"
     us-east-2 = "ami-08a0d1e16fc3f61ea"
}
}

# Define a list of subnets
variable "private_subnets" {
  description = "List of CIDR blocks for private subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "key" {
  description = "The SSH key name to use for the instance"
  type        = string
  default     = "key1"
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
  default     = "t2.micro"
}

variable "instance_count" {
  description = "The number of instances to create"
  type        = number
  default     = 1
}



output "map1" {
   value=lookup(var.ami,"us-east-2")
}

output "list1" {
   value=element(var.private_subnets,2)
}

output "list2" {
    value=var.private_subnets[0]
}



