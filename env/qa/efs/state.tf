terraform {
  backend "s3" {
    bucket  = "mybucket"
    key     = "qa/efs/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
