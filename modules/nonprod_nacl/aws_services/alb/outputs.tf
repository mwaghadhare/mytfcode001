output "alb_id" {
  value = "${aws_alb.alb.id}"
}

output "alb_arn_suffix" {
  value = "${aws_alb.alb.arn_suffix}"
}

output "app_alb_name" {
  value = "${aws_alb.alb.name}"
}

output "bii_tg" {
  value = "${aws_alb_target_group.bii.arn}"
}

output "bii_redirect_tg" {
  value = "${aws_alb_target_group.bii-redirect.arn}"
}

