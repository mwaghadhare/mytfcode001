data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket  = "bii-infra-state"
    key     = "central/vpc/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
