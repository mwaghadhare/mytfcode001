variable "env" {
  default     = ""
}

variable "state" {
  default     = "running"
}

variable "instance_name" {
  default     = "App-node"
}

variable "ops_inst_type" {
  default     = "t2.medium"
}

variable "ops_inst_ami_id" {
  default     = ""
}
variable "ops_inst_os" {
  default     = "Ubuntu 14.04 LTS"
}

variable "ssh_key_name" {
}

variable "stackid" {
}

variable "layerid" {
}

variable "subnetid" {
  type        = "list"
  default     = []
}

variable "agent_ver" {
  default     = "INHERIT"
}

variable "root_dev_type" {
  default     = "ebs"
}

variable "record_url" {
}

variable "hosted_zone_id" {
}

variable "app_instance_count"{
  description = "Number of Vcloud Webservers"
  default     = "1"
}

