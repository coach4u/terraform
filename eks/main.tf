module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.availability_zones
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway

  tags = var.tags
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  cluster_name    = var.eks_cluster_name

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = var.cluster_endpoint_public_access

  eks_managed_node_group_defaults = {
    ami_type = var.eks_ami_type
  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = var.eks_instance_types

      min_size     = var.eks_min_size_1
      max_size     = var.eks_max_size_1
      desired_size = var.eks_desired_size_1
    }

    two = {
      name = "node-group-2"

      instance_types = var.eks_instance_types

      min_size     = var.eks_min_size_2
      max_size     = var.eks_max_size_2
      desired_size = var.eks_desired_size_2
    }
  }
}
