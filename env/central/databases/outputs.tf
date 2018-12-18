# DB instance
output "rds_db_instance_address" {
  description = "The address of the RDS instance"
  value       = "${module.db_instance.rds_db_instance_address}"
}

output "rds_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = "${module.db_instance.rds_db_instance_arn}"
}

output "rds_db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = "${module.db_instance.rds_db_instance_availability_zone}"
}

output "rds_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = "${module.db_instance.rds_db_instance_endpoint}"
}

output "rds_db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = "${module.db_instance.rds_db_instance_hosted_zone_id}"
}

output "rds_db_instance_id" {
  description = "The RDS instance ID"
  value       = "${module.db_instance.rds_db_instance_id}"
}

output "rds_db_instance_resource_id" {
  description = "The RDS Resource ID of rds instance"
  value       = "${module.db_instance.rds_db_instance_resource_id}"
}

output "rds_db_instance_status" {
  description = "The RDS instance status"
  value       = "${module.db_instance.rds_db_instance_status}"
}

output "rds_db_instance_name" {
  description = "The database name"
  value       = "${module.db_instance.rds_db_instance_name}"
}

output "rds_db_instance_username" {
  description = "The master username for the database"
  value       = "${module.db_instance.rds_db_instance_username}"
}

output "rds_db_instance_password" {
  description = "The database password (rds password may be old, because Terraform doesn't track it after initial creation)"
  value       = "${var.password}"
}

output "rds_db_instance_port" {
  description = "The database port"
  value       = "${module.db_instance.rds_db_instance_port}"
}

# DB subnet group
output "rds_db_subnet_group_id" {
  description = "The db subnet group name"
  value       = "${module.db_subnet_group.rds_db_subnet_group_id}"
}

output "rds_db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = "${module.db_subnet_group.rds_db_subnet_group_arn}"
}

# DB parameter group
output "rds_db_parameter_group_id" {
  description = "The db parameter group id"
  value       = "${module.db_parameter_group.rds_db_parameter_group_id}"
}

output "rds_db_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = "${module.db_parameter_group.rds_db_parameter_group_arn}"
}

