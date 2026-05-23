variable "karpenter_chart_version" {
  type        = string
  description = "Version of the Karpenter Helm chart to deploy"
}

variable "tags" {
  type        = map(string)
  description = "Common tags applied to all resources"
  default     = {}
}