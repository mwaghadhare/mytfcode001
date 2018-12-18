output "stack_id" {
  value = "${module.opsworks_stack.stack_id_op}"
}

output "layer_id" {
  value = "${module.opsworks_stack.layer_id_op}"
}
