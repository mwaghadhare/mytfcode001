variable "bastion" {
  default = "bastion"
}

variable "org" {
  default = "bii"
}

resource "aws_iam_instance_profile" "bastion_iam_profile" {
  count = "${var.instance_profile == "" ? 1 : 0}"
  name  = "${var.org}-${var.env}-${var.bastion}-iam"
  role  = "${aws_iam_role.bastion_iam_role.name}"
}

resource "aws_iam_role" "bastion_iam_role" {
  count = "${var.instance_profile == "" ? 1 : 0}"
  name  = "${var.org}-${var.env}-${var.bastion}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ec2.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
