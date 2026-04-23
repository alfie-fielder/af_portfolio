vpc_name           = "af-portfolio-dev-use1"
vpc_cidr_block     = "10.2.0.0/16"
aws_region         = "us-east-1"
availability_zones = ["us-east-1a", "us-east-1b"]
subnet_cidrs       = ["10.2.1.0/24", "10.2.2.0/24"]
tgw_subnet_cidrs   = ["10.2.0.0/28", "10.2.0.16/28"]
flow_logs_enabled  = false

tags = {
  Environment = "dev"
  Region      = "us-east-1"
  ManagedBy   = "terraform"
  Project     = "af-portfolio"
}
