module "app-instance" {
  env            = "${var.env}"
  source         = "../../../modules/NONPROD_VTS_NEW/aws_services/opsworks/opsworks_instance/"
  state          = "running"
  ops_inst_type  = "t2.small"
  subnetid       = ["${data.terraform_remote_state.vpc.public_subnets}"]
  stackid        = "${module.opsworks_stack.stack_id_op}"
  layerid        = "${module.opsworks_stack.layer_id_op}"
  instance_name  = "web"
  ssh_key_name   = "${var.env}-${var.region}"
  hosted_zone_id = "${var.hosted_zone_id}"

  #record_url     = "webserver-${format("%03d",count.index)}.${var.env}.mwaghadhare.com"
  record_url         = ""
  app_instance_count = "${var.app_instance_count}"
}

module "vts-instance" {
  env            = "${var.env}"
  source         = "../../../modules/NONPROD_VTS_NEW/aws_services/opsworks/opsworks_instance/"
  state          = "running"
  subnetid       = ["${data.terraform_remote_state.vpc.public_subnets}"]
  stackid        = "${module.opsworks_stack.stack_id_op}"
  layerid        = "${module.opsworks_stack.layer_id_vts}"
  instance_name  = "vtsserver"
  ssh_key_name   = "${var.env}-${var.region}"
  hosted_zone_id = "${var.hosted_zone_id}"

  #record_url     = "vtsserver-1.${var.env}.mwaghadhare.com"
  record_url         = ""
  app_instance_count = "${var.vts_instance_count}"
}
