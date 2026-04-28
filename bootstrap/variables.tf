variable "aws_region" {
  description = "AWS region for bootstrap resources"
  type        = string
  default     = "us-east-1"
}

variable "project_prefix" {
  description = "Prefix for all resource names — must be globally unique for S3"
  type        = string
  default     = "af-portfolio"
}
