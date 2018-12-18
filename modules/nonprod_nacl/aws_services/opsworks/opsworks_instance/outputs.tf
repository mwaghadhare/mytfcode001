output "instance_prv_dns_op" {
  value = "${aws_opsworks_instance.app-instance.*.private_dns}"
}

