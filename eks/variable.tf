# VPC variables
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "my-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability Zones for the VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnets" {
  description = "Private subnets for the VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  description = "Public subnets for the VPC"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "enable_nat_gateway" {
  description = "Whether to enable NAT Gateway"
  type        = bool
  default     = true
}

variable "enable_vpn_gateway" {
  description = "Whether to enable VPN Gateway"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default     = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# EKS variables
variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "sample-cluster"
}

variable "cluster_endpoint_public_access" {
  description = "Whether the EKS cluster endpoint should be publicly accessible"
  type        = bool
  default     = true
}

variable "eks_ami_type" {
  description = "AMI type for EKS managed node groups"
  type        = string
  default     = "AL2_x86_64"
}

variable "eks_instance_types" {
  description = "Instance types for EKS node groups"
  type        = list(string)
  default     = ["t3.small","t2.medium"]
}

variable "eks_min_size_1" {
  description = "Minimum size for node group 1"
  type        = number
  default     = 1
}

variable "eks_max_size_1" {
  description = "Maximum size for node group 1"
  type        = number
  default     = 3
}

variable "eks_desired_size_1" {
  description = "Desired size for node group 1"
  type        = number
  default     = 2
}

variable "eks_min_size_2" {
  description = "Minimum size for node group 2"
  type        = number
  default     = 1
}

variable "eks_max_size_2" {
  description = "Maximum size for node group 2"
  type        = number
  default     = 2
}

variable "eks_desired_size_2" {
  description = "Desired size for node group 2"
  type        = number
  default     = 1
}
