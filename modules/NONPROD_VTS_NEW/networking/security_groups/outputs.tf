output "webserver_sg_id" {
  value = "${aws_security_group.webserver_sg.id}"
}

output "vts_sg_id" {
  value = "${aws_security_group.vts_sg.id}"
}

#output "bastion_sg_id" {
#  value = "${aws_security_group.bastion_sg.id}"
#}

output "alb_sg_id" {
  value = "${aws_security_group.alb_sg.id}"
}

#output "database_sg_id" {
#  value = "${aws_security_group.database_sg.id}"
#}

output "efs_sg_id" {
  value = "${aws_security_group.efs_sg.id}"
}

