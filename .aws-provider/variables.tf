variable "region" {
  default = "us-east-1"
}

variable "env" {
  default = "staging"
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
  default     = "arn:aws:iam::XXXXXXX:role/aws-opsworks-service-role"
}

variable "instance_profile_arn" {
  description = "The arn for instance profile role"
  default     = "arn:aws:iam::XXXXXXXXXX:instance-profile/aws-opsworks-ec2-role"
}

variable "aws_iam_role" {
        default = ""
}
variable "default_instance_profile_arn" {
        default = ""
}
#variable "vpc_id" {
#  default     = ""
#}


variable "git_url" {
  description = "Url to the repo containing Chef recipes"
  default     = "https://bitbucket.org/yourgithubfilepath"
}


variable "git_branch" {
  default     = "master"
}

variable "source_url" {
  description = "Repo for application code"
  default     = ""
}

variable "autoheal_flag" {
  description = "Enable instance reboot if crashed"
  default     = "false"
}

