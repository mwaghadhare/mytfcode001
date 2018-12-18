output "bii_target_group" {
  value = "${module.alb.bii_tg}"
}

output "bii_redirect_target_group" {
  value = "${module.alb.bii_redirect_tg}"
}

output "alb_arn_suffix" {
  value = "${module.alb.alb_arn_suffix}"
}

output "bii_tg-vts-8080" {
  value = "${module.alb.bii_tg-vts-8080}"
}

output "bii_tg-vts-9999" {
  value = "${module.alb.bii_tg-vts-9999}"
}

