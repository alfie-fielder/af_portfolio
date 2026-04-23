provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "github.com/alfie-fielder/af_portfolio_vpc_module?ref=v2.0.0"

  vpc_name              = var.vpc_name
  vpc_cidr_block        = var.vpc_cidr_block
  aws_region            = var.aws_region
  availability_zones    = var.availability_zones
  subnet_cidrs          = var.subnet_cidrs
  tgw_subnet_cidrs      = var.tgw_subnet_cidrs
  flow_logs_enabled     = var.flow_logs_enabled
  flow_log_bucket_arn   = var.flow_log_bucket_arn
  flow_log_iam_role_arn = var.flow_log_iam_role_arn
  tags                  = var.tags
}
