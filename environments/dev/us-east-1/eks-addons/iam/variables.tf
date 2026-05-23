variable "argocd_policy_name" {
  type        = string
  description = "Name of the ArgoCD IAM policy"
}

variable "argocd_file_path" {
  type        = string
  description = "Path to the ArgoCD IAM policy JSON file"
}

variable "argocd_policy_description" {
  type        = string
  description = "Description of the ArgoCD IAM policy"
  default     = "IAM policy for ArgoCD IRSA"
}

variable "argocd_tags" {
  type        = map(string)
  description = "Tags to apply to ArgoCD IAM resources"
  default     = {}
}

variable "argocd_role_name" {
  type        = string
  description = "Name of the ArgoCD IAM role"
}

variable "argocd_role_path" {
  type        = string
  description = "Path for the ArgoCD IAM role"
  default     = "/"
}

variable "argocd_role_description" {
  type        = string
  description = "Description of the ArgoCD IAM role"
  default     = "IRSA role for ArgoCD"
}

variable "argocd_role_max_session_duration" {
  type        = number
  description = "Max session duration in seconds for the ArgoCD role"
  default     = 3600
}

variable "karpenter_policy_name" {
  type        = string
  description = "Name of the Karpenter IAM policy"
}

variable "karpenter_file_path" {
  type        = string
  description = "Path to the Karpenter IAM policy JSON file"
}

variable "karpenter_policy_description" {
  type        = string
  description = "Description of the Karpenter IAM policy"
  default     = "IAM policy for Karpenter IRSA"
}

variable "karpenter_tags" {
  type        = map(string)
  description = "Tags to apply to Karpenter IAM resources"
  default     = {}
}

variable "karpenter_role_name" {
  type        = string
  description = "Name of the Karpenter IAM role"
}

variable "karpenter_role_path" {
  type        = string
  description = "Path for the Karpenter IAM role"
  default     = "/"
}

variable "karpenter_role_description" {
  type        = string
  description = "Description of the Karpenter IAM role"
  default     = "IRSA role for Karpenter"
}

variable "karpenter_role_max_session_duration" {
  type        = number
  description = "Max session duration in seconds for the Karpenter role"
  default     = 3600
}

variable "tags" {
  type        = map(string)
  description = "Common tags applied to all resources"
  default     = {}
}