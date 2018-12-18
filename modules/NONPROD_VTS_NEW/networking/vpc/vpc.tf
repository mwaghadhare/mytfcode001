# Create AWS VPC

resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"

  tags {
    #Name = "${var.region}-${var.env}"
    Name = "${var.env}-${var.region}"
    ENV  = "${var.env}"
  }
}

