data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "af-portfolio-tf-state-dev"
    key    = "environments/dev/us-east-1/eks/terraform.tfstate"
    region = "us-east-1"
  }
}