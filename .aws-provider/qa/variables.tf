variable "region" {
  default = "us-east-1"
}

variable "env" {
  default = "qa"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "zone_id_public" {
  default = ""
}

variable "zone_id_private" {
  default = ""
}

variable "user" {
  default = "ec2-user"
}

variable "root_volume_type" {
  description = "The root volume type for the instance like gp2, piops"
  default     = "gp2"
}

variable "root_volume_size" {
  description = "The root volume size default is 8"
  default     = "8"
}

variable "root_delete_on_termination" {
  description = "Boolean to make sure we need to delete root volume after termination or not?"
  default     = "true"
}

variable "device_name" {
  description = "The device name for the EBS storage either data or opt"
  default     = "/dev/sdb"
}

variable "volume_type" {
  description = "The data or opt volume type for the instance like gp2, piops"
  default     = "gp2"
}

variable "volume_size" {
  description = "The data or opt volume size default is 1 GB as by AWS and go upto 16TB"
  default     = "10"
}

variable "delete_on_termination" {
  description = "Boolean to make sure we need to delete opt ro data volume after termination or not?"
  default     = "false"
}

#opswork variables starts here
variable "service_role_arn" {
  description = "The arn for service role"
  default     = "arn:aws:iam::XXXXXXxxxxxX:role/aws-opsworks-service-role"
}

variable "instance_profile_arn" {
  description = "The arn for instance profile role"
  default     = "arn:aws:iam::XXXXXXxxxxxX:instance-profile/aws-opsworks-ec2-role"
}

variable "aws_iam_role" {
  default = ""
}

variable "default_instance_profile_arn" {
  default = ""
}

variable "git_url" {
  description = "Url to the repo containing Chef recipes"
  default     = "git@bitbucket.org:myrepo/infra-chef.git"
}

variable "git_branch" {
  default = "master"
}

variable "source_url" {
  description = "Repo for application code"
  default     = ""
}

variable "autoheal_flag" {
  description = "Enable instance reboot if crashed"
  default     = "false"
}

variable "origin" {
  default = "bii"
}

variable "hosted_zone_id" {
  description = "hosted zone id of mwaghadhare.com"
  default     = "XXxxx"
}

variable "app_instance_count" {
  description = "Number of Vcloud Webservers"
  default     = "1"
}

variable "vts_instance_count" {
  description = "Number of VTS Webservers"
  default     = "1"
}

variable "identifier" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
  default     = "bii-db-rds"
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  default     = 50
}

variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that rds behaviour is different from the AWS web console, where the default is 'gp2'."
  default     = "gp2"
}

variable "route53_record" {
  default = "rds-mysql-000"
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  default     = true
}

variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set rds to the destination KMS ARN. If storage_encrypted is set to true and kms_key_id is not specified the default KMS key created in your account will be used"
  default     = "arn:aws:kms:us-east-1:XXXXXXxxxxxX:key/976058d2-e625-4d3d-83a2-697644884e25"
}

variable "replicate_source_db" {
  description = "Specifies that rds resource is a Replicate database, and to use rds value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate."
  default     = ""
}

variable "snapshot_identifier" {
  description = "Specifies whether or not to create rds database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05."
  default     = ""
}

variable "license_model" {
  description = "License model information for rds DB instance. Optional, but required for some DB engines, i.e. Oracle SE1"
  default     = "general-public-license"
}

variable "iam_database_authentication_enabled" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled"
  default     = false
}

variable "engine" {
  description = "The database engine to use"
  default     = "mysql"
}

variable "engine_version" {
  description = "The engine version to use"
  default     = "5.6.39"
}

variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when rds DB instance is deleted."
  default     = false
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  default     = "db.t2.small"
}

variable "name" {
  description = "The DB name to create. If omitted, no database is created initially"
  default     = ""
}

variable "username" {
  description = "Username for the master DB user"
  default     = ""
}

variable "password" {
  description = "Password for the master DB user. Note that rds may show up in logs, and it will be stored in the state file"
  default     = ""
}

variable "port" {
  description = "The port on which the DB accepts connections"
  default     = 3306
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  default     = []
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  default     = false
}

variable "iops" {
  description = "The amount of provisioned IOPS. Setting rds implies a storage_type of 'io1'"
  default     = 0
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  default     = false
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  default     = 5
}

variable "monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. Must be specified if monitoring_interval is non-zero."
  default     = ""
}

variable "monitoring_role_name" {
  description = "Name of the IAM role which will be created when create_monitoring_role is enabled."
  default     = "rds-monitoring-role"
}

variable "create_monitoring_role" {
  description = "Create IAM role with a defined name that permits RDS to send enhanced monitoring metrics to CloudWatch Logs."
  default     = true
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing rds parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  default     = true
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  default     = true
}

variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  default     = "Sun:00:00-Sun:00:45"
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier"
  default     = true
}

variable "copy_tags_to_snapshot" {
  description = "On delete, copy all Instance tags to the final snapshot (if final_snapshot_identifier is specified)"
  default     = false
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  default     = 1
}

variable "backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  default     = "01:00-01:30"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  default     = {}
}

# DB subnet group
variable "subnet_ids" {
  type        = "list"
  description = "A list of VPC subnet IDs"
  default     = []
}

# DB parameter group
variable "family" {
  description = "The family of the DB parameter group"
  default     = "mysql5.6"
}

variable "parameters" {
  description = "A list of DB parameters (map) to apply"
  default     = []
}
