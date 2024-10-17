provider "aws" {
  region="us-east-1"
}

module "ec2_my_module" {
   source= "./modules/ec2/"
   instance_type="t2.small"
   key="keyname"
   ami="ami-0866a3c8686eaeeba"
}

