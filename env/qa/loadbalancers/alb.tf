module "alb" {
  source   = "../../../modules/NONPROD_VTS_NEW/aws_services/alb/"
  alb_name = "${var.env}-alb"
  service  = "alb"
  region   = "us-east-1"
  env      = "${var.env}"

  alb_security_group = "${data.terraform_remote_state.vpc.alb_sg_id}"
  vpc_id             = "${data.terraform_remote_state.vpc.vpc_id}"

  #  subnets            = "${data.terraform_remote_state.vpc.alb_subnets}"
  subnets                     = "${data.terraform_remote_state.vpc.public_subnets}"
  log_bucket                  = "${var.origin}-${var.env}-alb-logs-${var.region}"
  log_bucket_prefix           = "${var.env}"
  origin                      = "bii"
  healthy_threshold_check     = "5"
  unhealthy_threshold_check   = "2"
  timeout                     = "20"
  interval                    = "21"
  idle_timeout                = "400"
  connection_draining_timeout = "400"

  #iam_ssl_cert_arn            = "arn:aws:acm:us-east-1:XXXXXXxxxxxX:certificate/afe25dfb-ed735a0cb185"
  iam_ssl_cert_arn = "arn:aws:acm:us-east-1:XXXXXXxxxxxX:certificate/1af39559-a5c9eba9afd475"
  hosted_zone_id   = "${var.hosted_zone_id}"
  record_url       = "${var.env}.mwaghahdhare.com"
  record_url_vts              = "vts.${var.env}.mwaghadhare.com"
}
