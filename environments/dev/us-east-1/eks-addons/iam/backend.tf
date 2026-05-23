terraform {
  backend "s3" {
    bucket         = "af-portfolio-tf-state-dev"
    key            = "environments/dev/us-east-1/eks-addons/iam/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "af-portfolio-tf-state-lock-dev"
    encrypt        = true
  }
}