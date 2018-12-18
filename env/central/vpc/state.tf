terraform {
  backend "s3" {
    bucket  = "bii-infra-state"
    key     = "central/vpc/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
