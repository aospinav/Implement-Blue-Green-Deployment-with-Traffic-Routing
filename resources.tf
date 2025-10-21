resource "aws_lb" "web_lb" {
  name               = var.name_load_balancer
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.sg_http_lb.id]
  subnets = [
    data.aws_subnet.public_subnetA.id,
    data.aws_subnet.public_subnetB.id
  ]
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    # target_group_arn = aws_lb_target_group.blue.arn
    forward {
      target_group {
        arn    = aws_lb_target_group.blue.arn
        weight = var.blue_weight

      }

      target_group {
        arn    = aws_lb_target_group.green.arn
        weight = var.green_weight
      }

      stickiness {
        enabled  = false
        duration = 1
      }
    }
  }
}

