#Creating subnets

resource "aws_subnet" "test_subnet_1" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "test-subnet-1"
  }
}

resource "aws_subnet" "test_subnet_2" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "test-subnet-2"
  }
}

