resource "aws_security_group" "database_sg" {
  tags {
    Name = "${var.env}-${var.region}-database"
  }

  name        = "${var.env}-${var.region}-db"
  description = "DB Security Group ${var.env}"
  vpc_id      = "${var.vpc_id}"
}

resource "aws_security_group_rule" "egress_tcp_all_db" {
  count             = "${length(var.all_egress_db_tcp)}"
  type              = "egress"
  from_port         = "${var.all_egress_db_tcp[count.index]}"
  to_port           = "${var.all_egress_db_tcp[count.index]}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.database_sg.id}"
  description       = "egress to all from DB sg"
}

resource "aws_security_group_rule" "ingress_port_22_from_db" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = "${aws_security_group.bastion_sg.id}"
  security_group_id = "${aws_security_group.database_sg.id}"
  description       = "ingress to port 22 from bastion"
}
resource "aws_security_group_rule" "ingress_port_3306_from_bastion" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = "${aws_security_group.bastion_sg.id}"
  security_group_id = "${aws_security_group.database_sg.id}"
  description       = "ingress to port 3306 from bastion"
}

resource "aws_security_group_rule" "ingress_port_1_from_db" {
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.database_sg.id}"
  description       = "ingress to port -1 from planet"
}

resource "aws_security_group_rule" "ingress_port_3306_from_webserver" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = "${aws_security_group.webserver_sg.id}"
  security_group_id = "${aws_security_group.database_sg.id}"
  description       = "ingress to port 3306 from webserver"
}

resource "aws_security_group_rule" "ingress_port_3306_from_db_itself" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = "${aws_security_group.database_sg.id}"
  security_group_id = "${aws_security_group.database_sg.id}"
  description       = "ingress to port 3306 from db itself"
}

resource "aws_security_group_rule" "ingress_port_22_from_db_itself" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = "${aws_security_group.database_sg.id}"
  security_group_id = "${aws_security_group.database_sg.id}"
  description       = "ingress to ssh port from db itself"
}
resource "aws_security_group_rule" "ingress_port_3306_from_demo" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks	    = ["10.11.0.0/16","10.12.0.0/16","10.13.0.0/16","10.14.0.0/16","10.15.0.0/16","10.16.0.0/16"]
  #source_security_group_id = "${aws_security_group.database_sg.id}"
  security_group_id = "${aws_security_group.database_sg.id}"
  description       = "ingress to rds port from demo"
}
