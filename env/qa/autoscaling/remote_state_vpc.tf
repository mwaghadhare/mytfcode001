data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket  = "mybucket"
    key     = "qa/vpc/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
