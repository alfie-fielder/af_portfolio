variable "vpc_name" {
  description = "Name of the VPC. Used as a prefix for all resource names."
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC (e.g. '10.0.0.0/16')."
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy into (e.g. 'us-east-1')."
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones to deploy subnets into. Minimum two required."
  type        = list(string)
}

variable "subnet_cidrs" {
  description = "CIDR blocks for LAN subnets. One per AZ per subnets_per_az."
  type        = list(string)
}

variable "tgw_subnet_cidrs" {
  description = "CIDR blocks for Transit Gateway subnets. One per availability zone."
  type        = list(string)
}

variable "flow_logs_enabled" {
  description = "Whether to enable VPC flow logs."
  type        = bool
  default     = false
}

variable "flow_log_bucket_arn" {
  description = "ARN of the S3 bucket to send VPC flow logs to. Required when flow_logs_enabled is true."
  type        = string
  default     = ""
}

variable "flow_log_iam_role_arn" {
  description = "ARN of the IAM role for VPC flow logs. Required when flow_logs_enabled is true."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Map of tags to apply to all resources."
  type        = map(string)
  default     = {}
}
