resource "aws_autoscaling_policy" "policy1" {
  name                   = "instance_add_1"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.web-asg.name}"
}

resource "aws_autoscaling_policy" "policy2" {
  name                   = "instance_remove_1"
#  scaling_adjustment     = -1
  scaling_adjustment     = 0
#  adjustment_type        = "ChangeInCapacity"
  adjustment_type        = "ExactCapacity"
  cooldown               = 150
  autoscaling_group_name = "${aws_autoscaling_group.web-asg.name}"
}
