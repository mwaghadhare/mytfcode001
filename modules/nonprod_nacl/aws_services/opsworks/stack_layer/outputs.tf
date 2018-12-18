output "stack_id_op" {
  value = "${aws_opsworks_stack.stack.id}"
}

output "layer_id_op" {
  value = "${aws_opsworks_custom_layer.app-layer.id}"
}

#output "layer_id_op_dbm" {
#  value = "${aws_opsworks_custom_layer.DB-master.id}"
#}
#output "layer_id_op_dbs" {
#  value = "${aws_opsworks_custom_layer.DB-slave.id}"
#}
