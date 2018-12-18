#####################
# DB parameter group
#####################
module "db_parameter_group" {
  source = "../../../modules/nonprod_nacl/databases/rds/db_parameter_group/"

  identifier  = "bii-db-${var.env}-rds"
  name_prefix = "bii-db-${var.env}-rds-"
  family      = "${var.family}"

  parameters = ["${var.parameters}"]

  tags = "${var.tags}"
}
