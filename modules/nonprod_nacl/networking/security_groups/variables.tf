variable "vpc_id" {}
variable "env" {}
variable "region" {}
variable "bastion_sg_id" {}
#variable "webserver_sg_id" {}
variable "all_egress_tcp" {
  type    = "list"
  default = ["80", "443", "2181"]
}

variable "all_egress_udp" {
  type    = "list"
  default = ["123", "53"]
}

variable "all_egress_bastion_tcp" {
  type    = "list"
  default = ["22", "80", "443","3306"]
}

variable "all_egress_webserver_tcp" {
  type    = "list"
  default = ["22", "80", "443"]
}

variable "all_egress_db_tcp" {
  type    = "list"
  default = ["22", "80", "3306"]
}

variable "all_egress_efs_tcp" {
  type    = "list"
  default = ["2049"]
}

