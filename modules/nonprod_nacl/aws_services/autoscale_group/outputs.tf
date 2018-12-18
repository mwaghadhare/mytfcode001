output "asg_policy_up_arn" {
  value = "${aws_autoscaling_policy.policy1.arn}"
}

output "asg_policy_down_arn" {
  value = "${aws_autoscaling_policy.policy2.arn}"
}
