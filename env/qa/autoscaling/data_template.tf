data "template_file" "init" {
  template = "${file("userdata.tpl")}"
  vars {
    stack_id = "${data.terraform_remote_state.opsworks.stack_id}"
    layer_id = "${data.terraform_remote_state.opsworks.layer_id}"
  }
}

