variable "name" {
  type = "string"
  description = "(Required) The reference_name of your file system. Also, used in tags."
}

variable "subnets" {
  #type = "string"
  type        = "list"
  default     = []
  description = "(Required) A comma separated list of subnet ids where mount targets will be." 
}

variable "vpc_id" {
  type = "string"
  description = "(Required) The VPC ID where NFS security groups will be."
}
variable "zone_id_private" {
  description = "The zone_id of the route53 private zone where to create dns records"
  default    = ""
}
variable "route53_record" {
  description = "The name of the route53 private hosted  dns records"
}

variable "efs_sg_id" {
 default    = ""
}
