resource "aws_alb_listener" "bii" {
   load_balancer_arn = "${aws_alb.alb.arn}"
   port = 443
   #port = 80
   protocol = "HTTPS"
   #protocol = "HTTP"
   ssl_policy = "ELBSecurityPolicy-2016-08"
   certificate_arn = "${var.iam_ssl_cert_arn}"

   default_action {
     target_group_arn = "${aws_alb_target_group.bii.arn}"
     type = "forward"
   }
}

###################################################################

resource "aws_alb_listener_rule" "bii" {
  listener_arn = "${aws_alb_listener.bii.arn}"
  priority = 7

  action {
    type = "forward"
    target_group_arn = "${aws_alb_target_group.bii.arn}"
  }

  condition {
    field = "path-pattern"
    values = ["/*"]
  }
}

resource "aws_alb_target_group" "bii" {
  name     = "${var.alb_name}-bii"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"

   health_check {
     healthy_threshold   = "${var.healthy_threshold_check}"
     unhealthy_threshold = "${var.unhealthy_threshold_check}"
     timeout             = "${var.timeout}"
     path                = "/blank.php"
     interval            = "${var.interval}"
  }
}


###################################################################

resource "aws_alb_listener_rule" "bii-8080" {
  listener_arn = "${aws_alb_listener.bii.arn}"
  priority     = 6

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.vts-bii-8080.arn}"
  }

  condition {
    field  = "host-header"
    values = ["vts.${var.env}.buyitinstalled.co"]
  }
}


resource "aws_alb_target_group" "vts-bii-8080" {
  name     = "${var.alb_name}-vts-8080-bii"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"

   health_check {
     healthy_threshold   = "${var.healthy_threshold_check}"
     unhealthy_threshold = "${var.unhealthy_threshold_check}"
     timeout             = "${var.timeout}"
     path                = "/"
     interval            = "${var.interval}"
  }
}

###################################################################

resource "aws_alb_listener_rule" "bii-9999" {
  listener_arn = "${aws_alb_listener.bii.arn}"
  priority     = 5

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.vts-bii-9999.arn}"
  }

  condition {
    field  = "host-header"
    values = ["vts.${var.env}.buyitinstalled.co"]
  }

  condition {
    field = "path-pattern"
    values = ["/api/*"]
  }


}

resource "aws_alb_target_group" "vts-bii-9999" {
  name     = "${var.alb_name}-vts-9999-bii"
  port     = 9999
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"

   health_check {
     healthy_threshold   = "${var.healthy_threshold_check}"
     unhealthy_threshold = "${var.unhealthy_threshold_check}"
     timeout             = "${var.timeout}"
     path                = "/api/health"
     interval            = "${var.interval}"
  }
}

###################################################################

