data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "af-portfolio-tf-state-dev"
    key    = "environments/dev/us-east-1/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}