resource "aws_security_group" "webserver_sg" {
  tags {
    Name = "${var.env}-${var.region}-webserver"
  }

  name        = "${var.env}-${var.region}-webserver"
  description = "Bastion Security Group ${var.env}"
  vpc_id      = "${var.vpc_id}"
}

resource "aws_security_group_rule" "egress_tcp_all_webserver" {
  count             = "${length(var.all_egress_webserver_tcp)}"
  type              = "egress"
  from_port         = "${var.all_egress_webserver_tcp[count.index]}"
  to_port           = "${var.all_egress_webserver_tcp[count.index]}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.webserver_sg.id}"
  description       = "egress to all from webserver sg"
}

resource "aws_security_group_rule" "ingress_port_80_from_webserver" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.webserver_sg.id}"
  description       = "ingress to port 80 from planet"
}

resource "aws_security_group_rule" "ingress_port_8888_from_webserver" {
  type              = "ingress"
  from_port         = 8888
  to_port           = 8888
  protocol          = "tcp"
  source_security_group_id = "${aws_security_group.alb_sg.id}"
  security_group_id = "${aws_security_group.webserver_sg.id}"
  description       = "ingress to port 8888 from alb sg"
}


resource "aws_security_group_rule" "ingress_port_1_from_webserver" {
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.webserver_sg.id}"
  description       = "ingress to port -1 from planet"
}

resource "aws_security_group_rule" "ingress_port_22_from_webserver" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = "${aws_security_group.bastion_sg.id}"
  security_group_id = "${aws_security_group.webserver_sg.id}"
  description       = "SSH access from bastion server"
}

resource "aws_security_group_rule" "ingress_port_2049_to_webserver" {
  type              = "ingress"
  from_port         = 2049
  to_port           = 2049
  protocol          = "tcp"
  source_security_group_id = "${aws_security_group.efs_sg.id}"
  security_group_id = "${aws_security_group.webserver_sg.id}"
  description       = "Allow traffic from EFS to port 2049 on webserver"
}

resource "aws_security_group_rule" "egress_all" {
  type              = "egress"
  from_port         = 0 
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.webserver_sg.id}"
  description       = "egress to all from webserver sg"
}
