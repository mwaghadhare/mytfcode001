module "s3" {
  source    = "../../../modules/NONPROD_VTS_NEW/aws_services/s3/"
  origin    = "bii"
  env       = "${var.env}"
  region    = "us-east-1"
  service   = "alb"
  accountid = "432100021"
}
