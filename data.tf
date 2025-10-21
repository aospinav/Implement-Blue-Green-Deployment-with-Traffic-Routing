data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }

}

data "aws_subnet" "public_subnetA" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnetA]
  }
}
data "aws_subnet" "public_subnetB" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnetB]
  }
}
data "aws_security_group" "sg_ssh" {
  filter {
    name   = "tag:Name"
    values = [var.inboud_ssh_sg]
  }
}
data "aws_security_group" "sg_http_intances" {
  filter {
    name   = "tag:Name"
    values = [var.inboud_http_sg]
  }
}
data "aws_security_group" "sg_http_lb" {
  filter {
    name   = "tag:Name"
    values = [var.inboud_http_sg_lb]
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
  }
}
