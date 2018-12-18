module "efs" {
  source          = "../../../modules/NONPROD_VTS_NEW/aws_services/efs"
  name            = "${var.env}-efs"
  route53_record  = "efs-${var.env}.buyitinstalled.co"
  subnets         = "${data.terraform_remote_state.vpc.private_subnets}"
  vpc_id          = "${data.terraform_remote_state.vpc.vpc_id}"
  efs_sg_id       = "${data.terraform_remote_state.vpc.efs_sg_id}"
  zone_id_private = "${var.zone_id_private}"
}
