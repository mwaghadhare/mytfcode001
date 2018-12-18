output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "cidr_block" {
  value = "${module.vpc.cidr_block}"
}

output "public_subnets" {
  value = "${module.vpc.public_subnets}"
}

output "private_subnets" {
  value = "${module.vpc.private_subnets}"
}



output "public_route_table_id" {
  value = "${module.vpc.public_route_table_id}"
}

output "private_route_table_ids" {
  value = "${module.vpc.private_route_table_ids}"
}

output "nat_eips" {
  value = "${module.vpc.nat_eips}"
}

#output "private_zone_id" {
#  value = "${module.vpc.private_zone_id}"
#}

#output "public_zone_id" {
#  value = "${module.vpc.public_zone_id}"
#}

output "flow_log_id" {
  value = "${module.vpc.flow_log_id}"
}

output "flow_log_cwl_arn" {
  value = "${module.vpc.flow_log_cwl_arn}"
}

output "flow_log_cwl_name" {
  value = "${module.vpc.flow_log_cwl_name}"
}

output "bastion_sg_id" {
  value = "${module.security_groups.bastion_sg_id}"
}

output "webserver_sg_id" {
  value = "${module.security_groups.webserver_sg_id}"
}

output "database_sg_id" {
  value = "${module.security_groups.database_sg_id}"
}

output "bastion_ip" {
  value = "${module.bastion.bastion_ip}"
}

output "alb_sg_id" {
  value = "${module.security_groups.alb_sg_id}"
}
