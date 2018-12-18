variable "central_vpc_id" {
  default = ""
}

variable "central_cidr_block" {
  default = ""
}

variable "central_private_route_table_id" {
  type = "list"
  default = []
}

variable "central_public_route_table_id" {
  type = "list"
  default = []
}

variable "self_vpc_id" {
  default = ""
}

variable "self_public_route_table_id"{
  type = "list"
  default = []
}

variable "self_private_route_table_id"{
  type = "list"
  default = []
}

variable "self_cidr_block" {
  default = ""
}

variable "self_private_cidr_block"{
  type = "list"
  default = []
}

variable "self_public_cidr_block"{
  type = "list"
  default = []
}

variable "count" {
  default = ""
}

