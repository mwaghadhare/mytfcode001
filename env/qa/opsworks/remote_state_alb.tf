data "terraform_remote_state" "alb" {
  backend = "s3"

  config {
    bucket  = "mybucket"
    key     = "qa/loadbalancers/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
