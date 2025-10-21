resource "aws_launch_template" "green_launch_template_name" {
  name          = var.launch_name_green
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.type_instance

  network_interfaces {
    delete_on_termination       = true
    associate_public_ip_address = true

    security_groups = [
      data.aws_security_group.sg_ssh.id,
      data.aws_security_group.sg_http_intances.id
    ]
  }

  user_data = filebase64("${path.module}/start-green.sh")
}
#----------------------------------------------------------------------
resource "aws_autoscaling_group" "asg_green" {
  name             = var.name_auto_scaling_group_green
  max_size         = 2
  min_size         = 1
  desired_capacity = 2

  vpc_zone_identifier = [
    data.aws_subnet.public_subnetA.id,
    data.aws_subnet.public_subnetB.id
  ]

  launch_template {
    id      = aws_launch_template.green_launch_template_name.id
    version = "$Latest"
  }

  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }

}

#----------------------------------------------------------------------

resource "aws_lb_target_group" "green" {
  name        = var.name_tartget_group_green
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.main.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    matcher             = "200-399"
  }

}

#----------------------------------------------------------------------
resource "aws_autoscaling_attachment" "green" {
  autoscaling_group_name = aws_autoscaling_group.asg_green.id
  lb_target_group_arn    = aws_lb_target_group.green.arn
}