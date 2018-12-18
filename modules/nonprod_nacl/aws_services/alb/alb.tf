resource "aws_alb" "alb" {
  name            = "${var.alb_name}"
  internal        = "${var.alb_is_internal}"
  security_groups = ["${var.alb_security_group}"]
  subnets         = ["${var.subnets}"]

  enable_deletion_protection = false

  access_logs {
    bucket = "${var.log_bucket}"
    prefix = "${var.log_bucket_prefix}"
 }

  tags {
    Name = "${var.alb_name}-${var.region}"
    #Origin           = "${var.origin}"
    Environment      = "${var.env}"
  }
}

