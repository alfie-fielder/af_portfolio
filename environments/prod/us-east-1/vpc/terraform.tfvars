vpc_name           = "af-portfolio-prod-use1"
vpc_cidr_block     = "10.0.0.0/16"
aws_region         = "us-east-1"
availability_zones = ["us-east-1a", "us-east-1b"]
subnet_cidrs       = ["10.0.1.0/24", "10.0.2.0/24"]
tgw_subnet_cidrs   = ["10.0.0.0/28", "10.0.0.16/28"]

tags = {
  Environment = "prod"
  Region      = "us-east-1"
  ManagedBy   = "terraform"
  Project     = "af-portfolio"
}
