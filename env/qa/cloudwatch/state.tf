terraform {
  backend "s3" {
    bucket  = "mybucket"
    key     = "qa/cloudwatch/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
