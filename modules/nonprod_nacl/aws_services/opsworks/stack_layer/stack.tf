resource "aws_opsworks_stack" "stack" {
  name                         = "${var.env}-stack"
  region                       = "${var.region}"
  service_role_arn             = "${var.service_role_arn}"
  default_instance_profile_arn = "${var.instance_profile_arn}"
  vpc_id                       = "${var.vpc_id}"
  default_subnet_id            = "${var.subnet_id}"
  hostname_theme                = "Layer_Dependent"
  configuration_manager_name   = "Chef"
  configuration_manager_version= "12"
  default_os                   = "${var.def_os}"
  color                         = "${var.color}"
  use_custom_cookbooks          = "${var.use_custom_cookbooks}"
  use_opsworks_security_groups = "${var.use_opsworks_sg}"
  custom_cookbooks_source {
    type     = "git"
    url      = "${var.git_url}"
    ssh_key  = "${var.ssh_key}"
    revision = "${var.git_branch}"
  }
  tags {
    Terraform = "true"
  }


}

resource "aws_opsworks_custom_layer" "app-layer" {
  name       = "${var.env}-web-server-layer"
  short_name = "${var.app-layer-shortname}"
  stack_id   = "${aws_opsworks_stack.stack.id}"
  auto_healing = "${var.autoheal}"
  custom_security_group_ids = ["${var.ops_app_sg}"]
  custom_setup_recipes = "${var.app_setup_recipes}"
  custom_configure_recipes = "${var.app_config_recipes}"
  custom_shutdown_recipes = "${var.app_shutdown_recipes}"
  custom_json = "${var.app_custom_json}"
  auto_assign_public_ips = "${var.auto_public_ips}"
}

#resource "aws_opsworks_custom_layer" "DB-master" {
#  name       = "${var.env}-DB-master-layer"
#  short_name = "${var.dbm-shortname}"
#  stack_id   = "${aws_opsworks_stack.stack.id}"
#  auto_healing = "${var.dbm_autoheal}"
#  custom_security_group_ids = ["${var.ops_db_sg}"]  
#  custom_configure_recipes = "${var.dbm_config_recipes}"
#
#}

#resource "aws_opsworks_custom_layer" "DB-slave" {
#  name       = "${var.env}-DB-slave-layer"
#  short_name = "${var.dbs-shortname}"
#  stack_id   = "${aws_opsworks_stack.stack.id}"
#  auto_healing = "${var.dbs_autoheal}"
#  custom_security_group_ids = ["${var.ops_db_sg}"]
#  custom_configure_recipes = "${var.dbs_config_recipes}"
#
#}

resource "aws_opsworks_application" "web-app" {
  name        = "${var.env}-application"
  short_name  = "${var.application-shortname}"
  stack_id    = "${aws_opsworks_stack.stack.id}"
  type        = "other"
  description = "This is a PHP application"
  environment = {
    key    = "key"
    value  = "value"
    secure = false
  }
  app_source = {
    type     = "${var.app_source_type}"
    revision = "${var.app_source_revision}"
    url      = "${var.app_source_url}"
  }
  enable_ssl = false

#  ssl_configuration = {
#    private_key = "${file("./foobar.key")}"
#    certificate = "${file("./foobar.crt")}"
#  }

}
