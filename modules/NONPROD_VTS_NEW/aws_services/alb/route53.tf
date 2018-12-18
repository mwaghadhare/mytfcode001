resource "aws_route53_record" "dnsentry" {
  zone_id = "${var.hosted_zone_id}"
  name    = "${var.record_url}"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_alb.alb.dns_name}"]
}

resource "aws_route53_record" "dnsentry_vts" {
  zone_id = "${var.hosted_zone_id}"
  name    = "${var.record_url_vts}"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_alb.alb.dns_name}"]
}
