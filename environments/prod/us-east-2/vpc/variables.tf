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

variable "tags" {
  description = "Map of tags to apply to all resources."
  type        = map(string)
  default     = {}
}
