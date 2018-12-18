terraform {
  backend "s3" {
    bucket  = "mybucket"
    key     = "qa/vpc_peer/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
