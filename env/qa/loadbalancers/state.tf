terraform {
  backend "s3" {
    bucket  = "mybucket"
    key     = "qa/loadbalancers/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
