provider "aws" {
  region = "us-east-1" 
}

# Data source to fetch the latest Amazon Linux 2 AMI

data "aws_ami" "amzlinux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Data source to fetch the default VPC
data "aws_vpc" "default" {
  default = true
}

# Data source to fetch availability zones
data "aws_availability_zones" "available" {}

# Data source to fetch subnets in the default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Data source to fetch existing EC2 key pair (ensure this is correct)
data "aws_key_pair" "my_key" {
  key_name = "key121" 

# Security Group for EC2 instances
resource "aws_security_group" "example_sg" {
  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example-sg"
  }
}

# Create one EC2 instance per availability zone in the default VPC's subnets
resource "aws_instance" "ec2_example" {
  count = length(data.aws_availability_zones.available.names)

  ami           = data.aws_ami.amzlinux.id
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.my_key.key_name
  subnet_id     = data.aws_subnets.default.ids[count.index] 
  vpc_security_group_ids = [aws_security_group.example_sg.id]

  tags = {
    Name = "terraform-instance-${count.index + 1}"
  }
}
