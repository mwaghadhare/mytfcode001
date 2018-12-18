module "vpc" {
  source             = "../../../modules/nonprod_nacl/networking/vpc/"
  name               = "${var.env}-vpc"
  env                = "${var.env}"
  cidr               = "10.10.0.0/16"
  public_subnets     = ["10.10.1.0/24", "10.10.2.0/24"]
  private_subnets    = ["10.10.3.0/24","10.10.4.0/24"]
#  alb_public_ranges  = "10.11.11.0/24,10.11.12.0/24,10.11.13.0/24"
#  db_subnets         = ["10.11.3.0/24", "10.11.4.0/24"]
  azs                = "us-east-1b,us-east-1c"
  region             = "${var.region}"
  zone_id_private    = "${var.zone_id_private}"
  nat_gateways_count = 1
}
