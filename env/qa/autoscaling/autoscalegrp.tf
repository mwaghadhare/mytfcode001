#All ASG related variable should be set from here
module "asg" {
  source                    = "../../../modules/NONPROD_VTS_NEW/aws_services/autoscale_group/"
  instance_type             = "${var.instance_type}"
  ami                       = "ami-8oox5367ff"
  region                    = "${var.region}"
  subnet_id                 = "${data.terraform_remote_state.vpc.public_subnets[0]}"
  env                       = "${var.env}"
  launch_config_name        = "${var.env}-asg"
  asg_name                  = "${var.origin}-${var.env}-asg"
  security_groups           = ["${data.terraform_remote_state.vpc.webserver_sg_id}"]
  keyname                   = "${var.env}-${var.region}"
  max_size                  = "2"
  min_size                  = "0"
  desired_capacity          = "0"
  health_check_grace_period = "300"
  health_check_type         = "EC2"
  origin                    = "bii"
  user_data		    = "${data.template_file.init.rendered}"	
  iam_asg		    = "arn:aws:iam::XXXXXXxxxxxX:instance-profile/opsworks-register-ec2-role"
  sns_topic_arn		    = "arn:aws:sns:us-east-1:XXXXXXxxxxxX:deregister-opsworks-asg-scaledown"
}
