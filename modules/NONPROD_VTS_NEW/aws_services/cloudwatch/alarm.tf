resource "aws_cloudwatch_metric_alarm" "app-lb-requests" {
alarm_name          = "${var.alarm_name}"
comparison_operator = "${var.comparison_operator}"
evaluation_periods  = "${var.evaluation_periods}"

namespace           = "${var.namespace}"
metric_name         = "${var.metric_name}"
period              = "${var.period}"
statistic           = "${var.statistic}"
threshold           = "${var.threshold}"
dimensions {
  LoadBalancer      = "${var.dimensions_lb}"
}
alarm_description = "This metric monitor LB request count"
alarm_actions     = ["${var.alarm_action_lb}"]
ok_actions  	  = ["${var.alarm_ok_action_lb}"]
}
