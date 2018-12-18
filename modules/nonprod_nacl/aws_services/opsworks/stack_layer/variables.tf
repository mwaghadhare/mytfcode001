variable "env" {
}

variable "region" {
   default = "us-east-1"
}

variable "service_role_arn" {
  description = "The arn for service role"
}

variable "instance_profile_arn" {
  description = "The arn for instance profile role"
}


variable "vpc_id" {
}

variable "subnet_id" {
}

variable "def_os" {
   default = "Ubuntu 14.04 LTS"
}

variable "color" {
   default = "rgb(111, 86, 163)"
}

variable "use_custom_cookbooks" {
   default = "false"
}

variable "git_url" {
}

variable "git_branch" {
  default     = "master"
}

variable "ssh_key" {
}

variable "app-layer-shortname" {
  default     = "app"
}

variable "application-shortname" {
  default     = "app"
}

variable "autoheal" {
  default     = "true"
}

variable "ops_app_sg" {
}


variable "ops_db_sg" {
}

variable "app_source_type" {
  default     = "other"
}

variable "app_source_revision" {
  default     = "master"
}

variable "app_source_url" {
}

variable "dbm-shortname" {
  default = "db-master"
}

variable "dbm_autoheal" {
  default     = "true"
}


variable "dbm_config_recipes" {
  type = "list"
}

variable "dbs-shortname" {
  default = "db-slave"
}

variable "dbs_autoheal" {
  default     = "true"
}

variable "dbs_config_recipes" {
  type = "list"
}

variable "app_setup_recipes" {
  type = "list"
}

variable "app_config_recipes" {
  type = "list"
}

variable "app_shutdown_recipes" {
  type = "list"
}

variable "app_custom_json" {
  default = ""
}

variable "auto_public_ips" {
  default = "true"
}


variable "use_opsworks_sg" {
  default = "false"
}
