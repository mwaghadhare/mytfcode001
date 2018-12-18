resource "aws_s3_bucket" "alb" {
  bucket = "${var.origin}-${var.env}-${var.service}-logs-${var.region}"
  region = "${var.region}"
  force_destroy = "true"
  policy = <<EOF
{
        "Version": "2012-10-17",
        "Id": "AWSConsole-AccessLogs-Policy-1460144406039",
        "Statement": [
                {
                        "Sid": "AWSConsoleStmt-1460144406039",
                        "Effect": "Allow",
                        "Principal": {
                                "AWS": "arn:aws:iam::${var.accountid}:root"
                        },
                        "Action": "s3:PutObject",
                        "Resource": "arn:aws:s3:::${var.origin}-${var.env}-${var.service}-logs-${var.region}/*"
                }
        ]
}
EOF
}


