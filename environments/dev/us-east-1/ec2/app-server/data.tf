data "aws_ami" "app_server" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["af-portfolio-app-server-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = var.tfstate_bucket
    key    = "${var.environment}/us-east-1/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "sg" {
  backend = "s3"

  config = {
    bucket = var.tfstate_bucket
    key    = "${var.environment}/us-east-1/sg/app-server/terraform.tfstate"
    region = "us-east-1"
  }
}
