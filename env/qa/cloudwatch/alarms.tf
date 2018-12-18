module "cloudwatch_alarms" {
  source = "../../../modules/NONPROD_VTS_NEW/aws_services/cloudwatch/"
  
  alarm_name= "ALB-req-count-${var.env}"
  comparison_operator="GreaterThanOrEqualToThreshold"
  evaluation_periods= "1"
  namespace="AWS/ApplicationELB"
  metric_name="RequestCount"
  period="300"
  statistic="Sum"
  threshold="1000"
  dimensions_lb="${data.terraform_remote_state.alb.alb_arn_suffix}"
  alarm_action_lb=["${data.terraform_remote_state.autoscaling.policy_up_arn}"]
  alarm_ok_action_lb=["${data.terraform_remote_state.autoscaling.policy_down_arn}"]
}  
