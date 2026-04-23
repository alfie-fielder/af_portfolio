terraform {
  backend "s3" {
    bucket         = "af-portfolio-tf-state-prod"
    key            = "environments/prod/us-east-2/vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "af-portfolio-tf-state-lock-prod"
    encrypt        = true
  }
}
