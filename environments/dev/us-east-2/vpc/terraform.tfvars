vpc_name           = "af-portfolio-dev-use2"
vpc_cidr_block     = "10.3.0.0/16"
aws_region         = "us-east-2"
availability_zones = ["us-east-2a", "us-east-2b"]
subnet_cidrs       = ["10.3.1.0/24", "10.3.2.0/24"]
tgw_subnet_cidrs   = ["10.3.0.0/28", "10.3.0.16/28"]
flow_logs_enabled  = false

tags = {
  Environment = "dev"
  Region      = "us-east-2"
  ManagedBy   = "terraform"
  Project     = "af-portfolio"
}
