##################
# DB subnet group
##################
module "db_subnet_group" {
  source = "../../../modules/nonprod_nacl/databases/rds/db_subnet_group/"

  identifier  = "bii-db-${var.env}-rds"
  name_prefix = "bii-db-${var.env}-rds-"
  subnet_ids  = "${data.terraform_remote_state.vpc.private_subnets}"
  tags        = "${var.tags}"
}
