vpc_name           = "af-portfolio-prod-use2"
vpc_cidr_block     = "10.1.0.0/16"
aws_region         = "us-east-2"
availability_zones = ["us-east-2a", "us-east-2b"]
subnet_cidrs       = ["10.1.1.0/24", "10.1.2.0/24"]
tgw_subnet_cidrs   = ["10.1.0.0/28", "10.1.0.16/28"]

tags = {
  Environment = "prod"
  Region      = "us-east-2"
  ManagedBy   = "terraform"
  Project     = "af-portfolio"
}
