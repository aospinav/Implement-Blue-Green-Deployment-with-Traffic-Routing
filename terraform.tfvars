vpc_name                      = "cmtr-r6p03wfj-vpc"
public_subnetA                = "cmtr-r6p03wfj-public-subnet1"
public_subnetB                = "cmtr-r6p03wfj-public-subnet2"
inboud_ssh_sg                 = "cmtr-r6p03wfj-sg-ssh"
inboud_http_sg                = "cmtr-r6p03wfj-sg-http"
inboud_http_sg_lb             = "cmtr-r6p03wfj-sg-lb"
name_load_balancer            = "cmtr-r6p03wfj-lb"
name_target_groupt_blue       = "cmtr-r6p03wfj-blue-tg"
name_tartget_group_green      = "cmtr-r6p03wfj-green-tg"
name_auto_scaling_group_blue  = "cmtr-r6p03wfj-blue-asg"
name_auto_scaling_group_green = "cmtr-r6p03wfj-green-asg"
launch_name_blue              = "cmtr-r6p03wfj-blue-template"
launch_name_green             = "cmtr-r6p03wfj-green-template"
type_instance                 = "t2.micro"
blue_weight                   = 50
green_weight                  = 50




