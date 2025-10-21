variable "vpc_name" {
  description = "Name of the vpc name"
  type        = string
}
variable "public_subnetA" {
  description = "Name of public subnet"
  type        = string
}

variable "public_subnetB" {
  description = "Name of public subnet"
  type        = string
}

variable "inboud_ssh_sg" {
  description = "Allows SSH access"
  type        = string
}
variable "inboud_http_sg" {
  description = "Allows HTTP access to instances"
  type        = string
}
variable "inboud_http_sg_lb" {
  description = "Allows HTTP access to the Load Balancer"
  type        = string
}

variable "name_load_balancer" {
  description = "Name of load balancer"
  type        = string
}

variable "name_target_groupt_blue" {
  description = " Name target group blue"
  type        = string
}

variable "name_tartget_group_green" {
  description = " Name target group green"
  type        = string
}

variable "name_auto_scaling_group_blue" {
  description = "Name of the Auto Scaling Group"
  type        = string
}
variable "name_auto_scaling_group_green" {
  description = "Name of the Auto Scaling Group"
  type        = string
}

variable "launch_name_blue" {
  description = " Name of the template a"
  type        = string
}

variable "launch_name_green" {
  description = " Name of the template a"
  type        = string
}

variable "type_instance" {
  description = "Type of instance to lauch"
  type        = string
}

variable "blue_weight" {
  description = "The traffic weight for the Blue Target Group. Specifies the percentage of traffic routed to the Blue environment."
  type        = number
  default     = 100
}

variable "green_weight" {
  description = "The traffic weight for the Green Target Group. Specifies the percentage of traffic routed to the Green environment."
  type        = number
  default     = 0
}

