environment    = "dev"
tfstate_bucket = "af-portfolio-tfstate"

# Windows Server 2022 - us-east-1
# aws ssm get-parameter --name /aws/service/ami-windows-latest/Windows_Server-2022-English-Full-Base --query "Parameter.Value" --output text
ami           = "ami-0a1b2c3d4e5f67890"
instance_type = "m5.large"

root_volume_size = 127
root_volume_type = "gp3"
kms_key_id       = null

ebs_block_devices = []

tags = {
  Name        = "dev-dc-01"
  Role        = "domain-controller"
  OS          = "windows-server-2022"
  Environment = "dev"
  ManagedBy   = "terraform"
  Project     = "af-portfolio"
}

volume_tags = {
  Name        = "dev-dc-01-root"
  Role        = "domain-controller"
  Environment = "dev"
  ManagedBy   = "terraform"
  Project     = "af-portfolio"
}