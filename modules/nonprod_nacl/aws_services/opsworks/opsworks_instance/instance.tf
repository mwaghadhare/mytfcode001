##resource "aws_opsworks_instance" "app-instance" {
##  stack_id  = "${var.stackid}"
##  layer_ids = [
##    "${var.layerid}",
##  ]
##  instance_type = "${var.ops_inst_type}"
##  os            = "${var.ops_inst_os}"
##  state         = "${var.state}"
##  hostname      = "${var.instance_name}-${format("%03d",count.index)}-${var.env}"
##  ssh_key_name= "${var.ssh_key_name}"
##  subnet_id     ="${var.subnetid}"
##  agent_version = "${var.agent_ver}"
##  root_device_type = "${var.root_dev_type}"
##  ami_id	="${var.ops_inst_ami_id}"
##}
##
##resource "aws_route53_record" "dnsrecord" {
##  zone_id = "${var.hosted_zone_id}"
##  name    = "${var.record_url}"
##  type    = "CNAME"
##  ttl     = "300"
##  records = ["${aws_opsworks_instance.app-instance.public_dns}"]
##}

##################################################

resource "aws_opsworks_instance" "app-instance" {
  count   = "${var.app_instance_count}"
  stack_id  = "${var.stackid}"
  layer_ids = [
    "${var.layerid}",
  ]
  instance_type = "${var.ops_inst_type}"
  os            = "${var.ops_inst_os}"
  state         = "${var.state}"
  hostname      = "${var.instance_name}-${format("%03d",count.index)}-${var.env}"
  ssh_key_name  = "${var.ssh_key_name}"
  #subnet_id     ="${var.subnetid}"
  subnet_id     = "${element(var.subnetid,count.index)}"
  agent_version = "${var.agent_ver}"
  root_device_type = "${var.root_dev_type}"
  ami_id	="${var.ops_inst_ami_id}"
}

resource "aws_route53_record" "dnsrecord" {
  count   = "${var.app_instance_count}"
  zone_id = "${var.hosted_zone_id}"
  #name    = "${var.record_url}"
  name    = "${var.instance_name}-${format("%03d",count.index)}.${var.env}.mwaghadhare.com"
  type    = "CNAME"
  ttl     = "300"
  #records = ["${aws_opsworks_instance.app-instance.private_dns}"]
  records = ["${element(aws_opsworks_instance.app-instance.*.private_dns,count.index)}"]
}


