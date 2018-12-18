module "opsworks_stack" {
  source = "../../../modules/NONPROD_VTS_NEW/aws_services/opsworks/stack_layer/"

  #####stack config#####
  env                  = "${var.env}"
  region               = "${var.region}"
  service_role_arn     = "${var.service_role_arn}"
  instance_profile_arn = "${var.instance_profile_arn}"

  ##add module refernce
  vpc_id               = "${data.terraform_remote_state.vpc.vpc_id}"
  subnet_id            = "${data.terraform_remote_state.vpc.public_subnets[0]}"
  use_custom_cookbooks = "true"
  git_url              = "${var.git_url}"
  git_branch           = "${var.git_branch}"
  ssh_key              = "${file("./secrets/git_ssh_key.pem")}"

  #####layer config#####

  autoheal             = "${var.autoheal_flag}"
  ops_app_sg           = "${data.terraform_remote_state.vpc.webserver_sg_id}"
  ops_db_sg            = "${data.terraform_remote_state.vpc.database_sg_id}"
  dbm_config_recipes   = ["mysql_00::default", "mysql-replication-00::default", "db-setup::default"]
  dbs_config_recipes   = ["mysql_00::default", "mysql-replication-00::slave"]
  app_setup_recipes    = ["ntp", "apache-config"]
  #app_config_recipes   = ["alb_support::attach_to_alb"]
  app_config_recipes   = ["alb_support::attach_to_alb","manage-user::user","manage-user::group","manage-user::sudoers"]
  app_shutdown_recipes = ["alb_support::detach_from_alb"]
  #app_custom_json      = "{ \"alb_helper\": {\"target_group_arn\": \"${data.terraform_remote_state.alb.bii_target_group}\",\"target_group_arn_8888\": \"${data.terraform_remote_state.alb.bii_redirect_target_group}\"} }"
  #app_custom_json      = "{ \"alb_helper\": {\"target_group_arn\": \"${data.terraform_remote_state.alb.bii_target_group}\",\"target_group_arn_8888\": \"${data.terraform_remote_state.alb.bii_redirect_target_group}\"}, \"user\": {\"user1\": {\"id\": \"jenkins\",\"comments\": \"deploy_user\",\"home\": \"/home/jenkins\",\"shell\": \"/bin/bash\",\"sudo\": \"false\",\"password\": \"\",\"ssh_keys\": [\"ssh-rsa Ap23RLZUNrxFzKwdu9HbgDbrOT48lCPEgCNwOIMuTdifiBJr395Rp0BH+yRsE7yVW12hWY4Nvc3WSPsWzbGzTPWfDNb2BN0Esp846QZKxUfU6SdlHv64AucL\",\"ssh-rsa Ap23RLZUNrxFzKwdu9HbgDbrOT48lCPEgCNwOIMuTdifiBJr395Rp0BH+yRsE7yVW12hWY4Nvc3WSPsWzbGzTPWfDNb2BN0Esp846QZKxUfU6SdlHv64AucL\"]}},\"group\": {\"admin\": {\"gid\": \"3308\",\"members\": [\"jenkins\"]}} }"
  app_custom_json      = "{ \"alb_helper\": {\"target_group_arn\": \"${data.terraform_remote_state.alb.bii_target_group}\",\"target_group_arn_8888\": \"${data.terraform_remote_state.alb.bii_redirect_target_group}\"}, \"opsworks\": {\"data_bags\": {\"user\": {\"user1\": {\"id\": \"jenkins\",\"comments\": \"deploy_user\",\"home\": \"/home/jenkins\",\"shell\": \"/bin/bash\",\"sudo\": \"false\",\"password\": \"\",\"ssh_keys\": [\"ssh-rsa Aebp23RLZUNrxFzKwdu9HbgDbrOT48lCPEgCNwOIMuTdifiBJr395Rp0BH+yRsE7yVW12hWY4Nvc3WSPsWzbGzTPWfDNb2BN0Esp846QZKxUfU6SdlHv64AucL\",\"ssh-rsa AYebp23RLZUNrxFzKwdu9HbgDbrOT48lCPEgCNwOIMuTdifiBJr395Rp0BH+yRsE7yVW12hWY4Nvc3WSPsWzbGzTPWfDNb2BN0Esp846QZKxUfU6SdlHv64AucL\"]}},\"group\": {\"admin\": {\"gid\": \"3308\",\"members\": [\"jenkins\"]}}}} }"
  
  
  ##### VTS CONFIG #####
  ops_vts_sg           = "${data.terraform_remote_state.vpc.vts_sg_id}"
  vts_setup_recipes    = ["ntp", "vts-setup"]
  vts_config_recipes   = ["alb_support::attach_to_alb_vts"]
  vts_shutdown_recipes = ["alb_support::detach_from_alb_vts"]
  vts_custom_json      = "{ \"alb_helper\": {\"target_group_arn\": \"${data.terraform_remote_state.alb.bii_tg-vts-8080}\",\"target_group_arn1\": \"${data.terraform_remote_state.alb.bii_tg-vts-9999}\"} }"


  #####app config#####

  app_source_url = "${var.source_url}"
}
