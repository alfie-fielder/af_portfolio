variable "environment" {
  description = "The environment name. Used in resource naming and state key paths."
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "tfstate_bucket" {
  description = "The S3 bucket name where remote Terraform state files are stored."
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type for the app server."
  type        = string
  default     = "t3.large"
}

variable "key_name" {
  description = "The name of the EC2 key pair for the instance. Set to null if not required."
  type        = string
  default     = null
}

variable "root_volume_size" {
  description = "The size of the root EBS volume in GiB."
  type        = number
  default     = 50

  validation {
    condition     = var.root_volume_size >= 8 && var.root_volume_size <= 16384
    error_message = "root_volume_size must be between 8 and 16384 GiB."
  }
}

variable "root_volume_type" {
  description = "The type of the root EBS volume. Valid values: gp2, gp3, io1, io2."
  type        = string
  default     = "gp3"

  validation {
    condition     = contains(["gp2", "gp3", "io1", "io2"], var.root_volume_type)
    error_message = "root_volume_type must be one of: gp2, gp3, io1, io2."
  }
}

variable "kms_key_id" {
  description = "The ARN of the KMS key to use for EBS volume encryption. If null, uses the AWS-managed key (aws/ebs)."
  type        = string
  default     = null
}

variable "ebs_block_devices" {
  type = list(object({
    device_name           = string
    volume_size           = number
    volume_type           = optional(string)
    iops                  = optional(number)
    throughput            = optional(number)
    kms_key_id            = optional(string)
    delete_on_termination = optional(bool)
    snapshot_id           = optional(string)
    tags                  = optional(map(string))
  }))
  default = []
}

variable "tags" {
  description = "A map of tags to apply to the instance."
  type        = map(string)
  default     = {}
}

variable "volume_tags" {
  description = "A map of tags to apply to EBS volumes."
  type        = map(string)
  default     = {}
}
