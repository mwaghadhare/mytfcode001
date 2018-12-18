resource "aws_network_acl" "nacl" {
  vpc_id = "${aws_vpc.vpc.id}" 

egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

egress {
    protocol   = "tcp"
    rule_no    = 210
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

egress {
    protocol   = "tcp"
    rule_no    = 220
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 8888
    to_port    = 8888
  }

egress {
    protocol   = "tcp"
    rule_no    = 230
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 27017
    to_port    = 27017
  }

egress {
    protocol   = "tcp"
    rule_no    = 240
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 3306
    to_port    = 3306
  }

egress {
    protocol   = "tcp"
    rule_no    = 250
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 9999
    to_port    = 9999
  }

egress {
    protocol   = "tcp"
    rule_no    = 260
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 8080
    to_port    = 8080
  }
egress {
    protocol   = "tcp"
    rule_no    = 270
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }
egress {
    protocol   = "tcp"
    rule_no    = 280
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 2049
    to_port    = 2049
  }

ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

ingress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = "10.10.0.0/15"
    from_port  = 8888
    to_port    = 8888
  }

ingress {
    protocol   = "tcp"
    rule_no    = 121
    action     = "allow"
    cidr_block = "10.12.0.0/14"
    from_port  = 8888
    to_port    = 8888
  }

ingress {
    protocol   = "tcp"
    rule_no    = 122
    action     = "allow"
    cidr_block = "10.16.0.0/16"
    from_port  = 8888
    to_port    = 8888
  }

ingress {
    protocol   = "tcp"
    rule_no    = 130
    action     = "allow"
    cidr_block = "10.10.0.0/15"
    from_port  = 8080
    to_port    = 8080
  }

ingress {
    protocol   = "tcp"
    rule_no    = 131
    action     = "allow"
    cidr_block = "10.12.0.0/14"
    from_port  = 8080
    to_port    = 8080
  }

ingress {
    protocol   = "tcp"
    rule_no    = 132
    action     = "allow"
    cidr_block = "10.16.0.0/16"
    from_port  = 8080
    to_port    = 8080
  }



ingress {
    protocol   = "tcp"
    rule_no    = 140
    action     = "allow"
    cidr_block = "10.10.0.0/15"
    from_port  = 9999
    to_port    = 9999
  }

ingress {
    protocol   = "tcp"
    rule_no    = 141
    action     = "allow"
    cidr_block = "10.12.0.0/14"
    from_port  = 9999
    to_port    = 9999
  }

ingress {
    protocol   = "tcp"
    rule_no    = 142
    action     = "allow"
    cidr_block = "10.16.0.0/16"
    from_port  = 9999
    to_port    = 9999
  }



  ingress {
    protocol   = "tcp"
    rule_no    = 160
    action     = "allow"
    cidr_block = "10.10.0.0/15"
    from_port  = 22
    to_port    = 22
  }


  ingress {
    protocol   = "tcp"
    rule_no    = 161
    action     = "allow"
    cidr_block = "10.12.0.0/14"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 162
    action     = "allow"
    cidr_block = "10.16.0.0/16"
    from_port  = 22
    to_port    = 22
  }

  
  ingress {
    protocol   = "tcp"
    rule_no    = 170
    action     = "allow"
    cidr_block = "10.10.0.0/15"
    from_port  = 3306
    to_port    = 3306
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 171
    action     = "allow"
    cidr_block = "10.12.0.0/14"
    from_port  = 3306
    to_port    = 3306
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 172
    action     = "allow"
    cidr_block = "10.16.0.0/16"
    from_port  = 3306
    to_port    = 3306
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 180
    action     = "allow"
    cidr_block = "10.10.0.0/15"
    from_port  = 27017
    to_port    = 27017
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 181
    action     = "allow"
    cidr_block = "10.12.0.0/14"
    from_port  = 27017
    to_port    = 27017
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 182
    action     = "allow"
    cidr_block = "10.16.0.0/16"
    from_port  = 27017
    to_port    = 27017
  }
ingress {
    protocol   = "tcp"
    rule_no    = 183
    action     = "allow"
    cidr_block = "10.10.0.0/15"
    from_port  = 2049
    to_port    = 2049
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 184
    action     = "allow"
    cidr_block = "10.12.0.0/14"
    from_port  = 2049
    to_port    = 2049
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 185
    action     = "allow"
    cidr_block = "10.16.0.0/16"
    from_port  = 2049
    to_port    = 2049
  }

  tags {
     Name = "${var.env}-${var.region}-nacl"
  }
}
