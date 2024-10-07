# Create a load balancer
resource "aws_lb" "test_lb" {
  name               = "test-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.test_subnet_1.id, aws_subnet.test_subnet_2.id]

  security_groups = [aws_security_group.test_sg.id]
}

#Create a target group
resource "aws_lb_target_group" "test_tg" {
name = "test-tg"
port = 80
protocol = "HTTP"

vpc_id = aws_vpc.test_vpc.id

health_check {
interval = 30
path = "/"
protocol = "HTTP"
timeout = 10
healthy_threshold = 3
unhealthy_threshold = 3
}

tags = {
Name = "test-tg"
}
}
