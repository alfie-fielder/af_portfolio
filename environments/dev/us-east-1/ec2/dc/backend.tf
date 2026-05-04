terraform {
  backend "s3" {
    bucket         = "af-portfolio-tfstate"
    key            = "dev/us-east-1/ec2/dc/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "af-portfolio-tfstate-lock"
  }
}