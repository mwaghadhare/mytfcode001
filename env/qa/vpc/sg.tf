module "security_groups" {
  source        = "../../../modules/NONPROD_VTS_NEW/networking/security_groups/"
  vpc_id        = "${module.vpc.vpc_id}"
  env           = "${var.env}"
  region        = "${var.region}"
#  bastion_sg_id = "${module.security_groups.bastion_sg_id}"
}
