variable "alarm_name" {
  description = "Name of the alarm"
}

variable "comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold"
  default     = "GreaterThanOrEqualToThreshold"
}

variable "evaluation_periods" {
  description = " The number of periods over which data is compared to the specified threshold."
  default     = "1"
}

variable "metric_name" {
  description = "The name for the alarm's associated metric."
  default     = "StatusCheckFailed"
}

variable "namespace" {
  description = "The namespace for the alarm's associated metric. "
  default     = "AWS/EC2"
}

variable "period" {
  description = "The period in seconds over which the specified statistic is applied."
  default     = "300"
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  default     = "Maximum"
}

variable "threshold" {
  description = "The value against which the specified statistic is compared."
  default     = "1"
}

variable "dimensions_lb" {
  description = "Name of the ALB"
}

variable "alarm_action_lb" {
  description = "ARN of the ASG Policy"
  type = "list"
}

variable "alarm_ok_action_lb" {
  description = "ARN of the ASG Policy"
  type = "list"
}
