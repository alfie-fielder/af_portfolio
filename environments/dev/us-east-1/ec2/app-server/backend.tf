terraform {
  backend "s3" {
    bucket       = "af-portfolio-tfstate"
    key          = "dev/us-east-1/ec2/app-server/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}