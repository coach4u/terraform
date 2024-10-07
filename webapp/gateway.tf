resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.mytest_vpc.id

  tags = {
    Name = "test-igw"
  }
}

