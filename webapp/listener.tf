resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.test_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test_tg.arn
  }

  depends_on = [aws_lb_target_group.test_tg]
}
