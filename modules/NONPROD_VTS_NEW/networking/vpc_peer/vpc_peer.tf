resource "aws_vpc_peering_connection" "vpc_peer" {
  peer_vpc_id   = "${var.central_vpc_id}"
  vpc_id        = "${var.self_vpc_id}"
  auto_accept   = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}

#Entry in local vpc private route table
resource "aws_route" "to_cvpc_private_route" {
  count                             = "${length(var.self_private_route_table_id)}"
  route_table_id                    = "${element(var.self_private_route_table_id,count.index)}"
  destination_cidr_block            = "${var.central_cidr_block}"
  vpc_peering_connection_id         = "${aws_vpc_peering_connection.vpc_peer.id}"
}


#Entry in local vpc public route table
resource "aws_route" "to_cvpc_public_route" {
  count                             = "${length(var.self_public_route_table_id)}"
  route_table_id                    = "${element(var.self_public_route_table_id,count.index)}"
  destination_cidr_block            = "${var.central_cidr_block}"
  vpc_peering_connection_id         = "${aws_vpc_peering_connection.vpc_peer.id}"
}

# entry  in central vpc private route table
resource "aws_route" "from_cvpc_private_route" {
  count                             = "${length(var.central_private_route_table_id)}"
  route_table_id                    = "${element(var.central_private_route_table_id,count.index)}"
  destination_cidr_block            = "${var.self_cidr_block}"
  vpc_peering_connection_id         = "${aws_vpc_peering_connection.vpc_peer.id}"
}

# entry  in central vpc public route table
resource "aws_route" "from_cvpc_public_route" {
  route_table_id                    = "${var.central_public_route_table_id[0]}"
  destination_cidr_block            = "${var.self_cidr_block}"
  vpc_peering_connection_id         = "${aws_vpc_peering_connection.vpc_peer.id}"
}
