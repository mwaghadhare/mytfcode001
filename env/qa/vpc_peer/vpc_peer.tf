module "vpc_peer" {
  source = "../../../modules/NONPROD_VTS_NEW/networking/vpc_peer/"

  #name               = "${var.env}-central-vpc-peer"
  #env                = "${var.env}"
  central_vpc_id = "${data.terraform_remote_state.central_vpc.vpc_id}"

  central_cidr_block             = "${data.terraform_remote_state.central_vpc.cidr_block}"
  central_private_route_table_id = ["${data.terraform_remote_state.central_vpc.private_route_table_ids}"]
  central_public_route_table_id  = ["${data.terraform_remote_state.central_vpc.public_route_table_id}"]

  self_vpc_id                 = "${data.terraform_remote_state.vpc.vpc_id}"
  self_private_route_table_id = ["${data.terraform_remote_state.vpc.private_route_table_ids}"]
  self_public_route_table_id  = ["${data.terraform_remote_state.vpc.public_route_table_id}"]

  self_cidr_block         = "${data.terraform_remote_state.vpc.cidr_block}"
  #self_public_cidr_block  = ["${data.terraform_remote_state.vpc.public_subnets_cidr}"]
  #self_private_cidr_block = ["${data.terraform_remote_state.vpc.private_subnets_cidr}"]
}
