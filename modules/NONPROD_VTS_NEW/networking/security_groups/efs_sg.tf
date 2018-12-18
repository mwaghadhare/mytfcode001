resource "aws_security_group" "efs_sg" {
  tags {
    Name = "${var.env}-${var.region}-efs"
  }

  name        = "${var.env}-${var.region}-efs"
  description = "EFS Security Group ${var.env}"
  vpc_id      = "${var.vpc_id}"
}

#resource "aws_security_group_rule" "egress_tcp_2049_efs" {
#  count             = "${length(var.all_egress_efs_tcp)}"
#  type              = "egress"
#  from_port         = "${var.all_egress_efs_tcp[count.index]}"
#  to_port           = "${var.all_egress_efs_tcp[count.index]}"
#  protocol          = "tcp"
#  cidr_blocks       = ["0.0.0.0/0"]
#  security_group_id = "${aws_security_group.efs_sg.id}"
#  description       = "egress to all from efs sg"
#}

resource "aws_security_group_rule" "ingress_port_2049_from_webserver" {
  type              = "ingress"
  from_port         = 2049
  to_port           = 2049
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = "${aws_security_group.webserver_sg.id}"
  security_group_id = "${aws_security_group.efs_sg.id}"
  description       = "ingress to efs port 2049 from webserver"
}

resource "aws_security_group_rule" "egress_tcp_2049_efs" {
  type              = "egress"
  from_port         = 2049
  to_port           = 2049
  protocol          = "tcp"
  #cidr_blocks       = ["0.0.0.0/0"]
  source_security_group_id = "${aws_security_group.webserver_sg.id}"
  security_group_id = "${aws_security_group.efs_sg.id}"
  description       = "egress from efs to webserver sg"
}

