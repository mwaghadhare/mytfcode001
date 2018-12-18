output "policy_up_arn" {
  value = "${module.asg.asg_policy_up_arn}"
}

output "policy_down_arn" {
  value = "${module.asg.asg_policy_down_arn}"
}
