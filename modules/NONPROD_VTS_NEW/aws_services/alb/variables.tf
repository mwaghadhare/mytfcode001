variable "alb_name" {}

variable "alb_is_internal" {
  description = "Determines if the ALB is internal or not"
  default     = false
}

variable "alb_security_group" {}

variable "env" {}

variable "service" {}

variable "region" {}

variable "vpc_id" {}

variable "subnets" {
  type = "list"
}

variable "iam_ssl_cert_arn" {}

#variable "healthy_threshold" {}

variable "log_bucket" {}

variable "log_bucket_prefix" {}

variable "healthy_threshold_check" {}

variable "unhealthy_threshold_check" {}

variable "timeout" {}

variable "interval" {}

variable "idle_timeout" {}

variable "connection_draining_timeout" {}

variable "origin" {}

variable "record_url" {
  description = "DNS url for loadbalancer endpoint"
}

variable "record_url_vts" {
  description = "DNS url for loadbalancer endpoint"
}

variable "hosted_zone_id" {
  description = "hosted zone id of the public hosted zone"
}
