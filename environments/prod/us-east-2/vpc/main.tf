provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "github.com/alfie-fielder/af_portfolio_vpc_module?ref=v1.0.0"

  vpc_name           = var.vpc_name
  vpc_cidr_block     = var.vpc_cidr_block
  aws_region         = var.aws_region
  availability_zones = var.availability_zones
  subnet_cidrs       = var.subnet_cidrs
  tgw_subnet_cidrs   = var.tgw_subnet_cidrs
  tags               = var.tags
}
