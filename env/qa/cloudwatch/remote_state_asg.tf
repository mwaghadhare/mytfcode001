data "terraform_remote_state" "autoscaling" {
  backend = "s3"

  config {
    bucket  = "mybucket"
    key     = "qa/autoscaling/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
