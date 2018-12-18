resource "aws_instance" "bastion" {
  ami                    = "${data.aws_ami.ubuntu.id}"
  availability_zone      = "${var.fullaz}"
  count                  = "${var.number_of_instances}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.security_groups}"]
  subnet_id              = "${var.subnet_id}"
  instance_type          = "${var.instance_type}"
  iam_instance_profile        = "${coalesce(var.instance_profile,join("",aws_iam_instance_profile.bastion_iam_profile.*.name))}"
  source_dest_check           = false
  associate_public_ip_address = true

  root_block_device {
    volume_type           = "${var.root_volume_type}"
    volume_size           = "${var.root_volume_size}"
    delete_on_termination = "${var.root_delete_on_termination}"
  }


  tags {
    managed_by  = "terraform"
    Name        = "${var.name}-${format("%03d",count.index)}-${var.env}"
    Environment = "${var.env}"
  }
  volume_tags {
    managed_by  = "terraform"
    Name        = "${var.name}-${format("%03d",count.index)}-${var.env}"
    Environment = "${var.env}"
  }
}
