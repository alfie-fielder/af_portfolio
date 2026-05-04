variable "cluster_name" {
  description = "Name of the EKS cluster. Used as a prefix for all resource names."
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version to use for the EKS cluster (e.g. '1.29')."
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy into (e.g. 'us-east-1')."
  type        = string
}

variable "public_endpoint" {
  description = "Whether to enable public access to the EKS API endpoint."
  type        = bool
  default     = false
}

variable "node_groups" {
  description = "Map of managed node group configurations."
  type = map(object({
    instance_types = list(string)
    capacity_type  = string
    desired_size   = number
    min_size       = number
    max_size       = number
  }))
}

variable "addons" {
  description = "Map of EKS addon names to their configuration."
  type = map(object({
    version = string
  }))
}

variable "tags" {
  description = "Map of tags to apply to all resources."
  type        = map(string)
  default     = {}
}