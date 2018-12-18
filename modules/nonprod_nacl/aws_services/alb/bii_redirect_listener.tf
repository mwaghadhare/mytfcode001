resource "aws_alb_listener" "bii-redirect" {
   load_balancer_arn = "${aws_alb.alb.arn}"
   port = 80
   protocol = "HTTP"

   default_action {
     target_group_arn = "${aws_alb_target_group.bii-redirect.arn}"
     type = "forward"
   }
}

###################################################################

resource "aws_alb_listener_rule" "bii-redirect" {
  listener_arn = "${aws_alb_listener.bii-redirect.arn}"
  priority = 4

  action {
    type = "forward"
    target_group_arn = "${aws_alb_target_group.bii-redirect.arn}"
  }

  condition {
    field = "path-pattern"
    values = ["/*"]
  }
}

resource "aws_alb_target_group" "bii-redirect" {
  name     = "${var.alb_name}-bii-redirect"
  port     = 8888
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"

   health_check {
     healthy_threshold   = "${var.healthy_threshold_check}"
     unhealthy_threshold = "${var.unhealthy_threshold_check}"
     timeout             = "${var.timeout}"
     path                = "/"
     matcher             = "301"
     interval            = "${var.interval}"
  }
}


###################################################################

