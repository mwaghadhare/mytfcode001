resource "aws_autoscaling_group" "web-asg" {
  launch_configuration = "${aws_launch_configuration.web-asg-conf.id}"

  #    availability_zones  =   ["${split(",", var.fullaz)}"]
  name                      = "${var.asg_name}"
  max_size                  = "${var.max_size}"
  min_size                  = "${var.min_size}"
  health_check_grace_period = "${var.health_check_grace_period}"
  health_check_type         = "${var.health_check_type}"
  desired_capacity          = "${var.desired_capacity}"
  vpc_zone_identifier       = ["${var.subnet_id}"]
  target_group_arns         = ["${split(",", var.target_group_arns)}"]
  tag {
    key                 = "Name"
    value               = "${var.origin}-${var.env}-asg"
    propagate_at_launch = "true"
  }
}

resource "aws_autoscaling_notification" "asg_notifications" {
  group_names = [
    "${aws_autoscaling_group.web-asg.name}",
  ]

  notifications = [
    "autoscaling:EC2_INSTANCE_TERMINATE",
  ]

  topic_arn = "${var.sns_topic_arn}"
}

resource "aws_launch_configuration" "web-asg-conf" {
  name_prefix   = "${var.launch_config_name}"
  image_id      = "${var.ami}"
  instance_type = "${var.instance_type}"

  iam_instance_profile    =   "${var.iam_asg}"
  key_name        = "${var.keyname}"
  security_groups = ["${var.security_groups}"]
  user_data       = "${var.user_data}"
}
