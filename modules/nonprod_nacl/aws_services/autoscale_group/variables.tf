variable "name" {
  description = "Name of the bastion cluster (for ex. bastion)"
  default     = "bastion"
}

variable "env" {
  description = "Environment name, like poc-000, staging-000 etc."
  default     = "staging-000"
}

variable "instance_type" {
  description = "EC2 type for webserver instances"
  default     = "t2.medium"
}

variable "subnet_id" {
  description = "List of VPC subnets the instance(s) will go in"
}

variable "security_groups" {
  description = "The associated security groups"
  type        = "list"
}

variable "number_of_instances" {
  description = "Number of instances in the webserver cluster"
  default     = 1
}

variable "region" {
  description = "AWS region where to create the webserver instances"
  default     = "us-east-1"
}

variable "instance_profile" {
  description = "The IAM Instance Profile to launch the instances with; if undefined the module will create one"
  default     = ""
}

variable "ebs_optimized" {
  description = "Do we need EBS optimized instances? (not all instances support this)"
  default     = false
}

#variable "zone_id_private" {
#  description = "The zone_id of the route53 private zone where to create dns records"
#}

#variable "zone_id_public" {
#  description = "The zone_id of the route53 public zone where to create dns records"
#}

variable "ami_id" {
  description = "The AMI to use for webserver instances."
  default     = ""
}

#variable "fullaz" {
#  description = " Availability Zone in which instance will get launch"
#  default     = ""
#}

variable "user" {
  description = "The default user to get Chef client in to bootstrap nodes"
  default     = ""
}

variable "root_volume_type" {
  description = "The root volume type for the isntance like gp2, piops"
  default     = ""
}

variable "root_volume_size" {
  description = "The root volume size default is 8"
  default     = ""
}

variable "root_delete_on_termination" {
  description = "Boolean to make sure we need to delete root volume after termination or not?"
  default     = ""
}

variable "device_name" {
  description = "The device name for the EBS storage either data or opt"
  default     = ""
}

variable "volume_type" {
  description = "The data or opt volume type for the isntance like gp2, piops"
  default     = ""
}

variable "volume_size" {
  description = "The data or opt volume size default is 1 GB as by AWS and go upto 16TB"
  default     = ""
}

variable "delete_on_termination" {
  description = "Boolean to make sure we need to delete opt ro data volume after termination or not?"
  default     = ""
}

## Adding ASG variables here

variable "iam_asg" {
  description = "ARN of Ec2 Instance Role to be assigned to ASG instances"
}
variable "origin" {}
variable "ami" {}

variable "asg_name" {}

variable "keyname" {}

variable "target_group_arns" {
  default = ""
}

variable "sns_topic_arn" {
  description = "ARN of SNS topic created for de-registering ASG instances"
}
variable "max_size" {}

variable "min_size" {}

variable "desired_capacity" {}

variable "health_check_grace_period" {}

variable "health_check_type" {}

#variable "target_group_arns" {}

variable "launch_config_name" {}

variable "user_data" {}
