resource "aws_security_group" "vts_sg" {
  tags {
    Name = "${var.env}-${var.region}-vts"
  }

  name        = "${var.env}-${var.region}-vts"
  description = "VTS Security Group ${var.env}"
  vpc_id      = "${var.vpc_id}"
}

resource "aws_security_group_rule" "egress_tcp_all_vts" {
  count             = "${length(var.all_egress_vts_tcp)}"
  type              = "egress"
  from_port         = "${var.all_egress_vts_tcp[count.index]}"
  to_port           = "${var.all_egress_vts_tcp[count.index]}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.vts_sg.id}"
  description       = "egress to all from vts sg"
}

resource "aws_security_group_rule" "ingress_port_8080_from_vts" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = "${aws_security_group.alb_sg.id}"
  security_group_id = "${aws_security_group.vts_sg.id}"
  description       = "ingress to port 80 from planet"
}

resource "aws_security_group_rule" "ingress_port_9998_9999_from_vts" {
  type              = "ingress"
  from_port         = 9998
  to_port           = 9999
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = "${aws_security_group.alb_sg.id}"
  security_group_id = "${aws_security_group.vts_sg.id}"
  description       = "ingress to port 80 from planet"
}

resource "aws_security_group_rule" "ingress_port_8085_from_vts" {
  type              = "ingress"
  from_port         = 8085
  to_port           = 8085
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = "${aws_security_group.alb_sg.id}"
  security_group_id = "${aws_security_group.vts_sg.id}"
  description       = "ingress to port 80 from planet"
}

resource "aws_security_group_rule" "ingress_port_443_from_vts" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = "${aws_security_group.alb_sg.id}"
  security_group_id = "${aws_security_group.vts_sg.id}"
  description       = "ingress to port 80 from planet"
}


resource "aws_security_group_rule" "ingress_port_1_from_vts" {
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.vts_sg.id}"
  description       = "ingress to port -1 from planet"
}

#resource "aws_security_group_rule" "ingress_port_22_from_vts" {
#  type              = "ingress"
#  from_port         = 22
#  to_port           = 22
#  protocol          = "tcp"
#  source_security_group_id = "${aws_security_group.bastion_sg.id}"
#  security_group_id = "${aws_security_group.vts_sg.id}"
#  description       = "SSH access from bastion server"
#}

