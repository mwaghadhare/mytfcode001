output "bastion_instance_id" {
  value = "${aws_instance.bastion.*.id}"
}

output "bastion_ip" {
  value = "${aws_instance.bastion.*.public_ip}"
}
