data "terraform_remote_state" "opsworks" {
  backend = "s3"

  config {
    bucket  = "mybukcket"
    key     = "qa/opsworks/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
