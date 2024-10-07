resource "aws_route_table" "test_rt" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_igw.id
  }

  tags = {
    Name = "test-rt"
  }
}

# Associate subnets with route table
resource "aws_route_table_association" "test_rt_assoc_1" {
  subnet_id      = aws_subnet.test_subnet_1.id
  route_table_id = aws_route_table.test_rt.id
}

resource "aws_route_table_association" "test_rt_assoc_2" {
  subnet_id      = aws_subnet.test_subnet_2.id
  route_table_id = aws_route_table.test_rt.id
}
