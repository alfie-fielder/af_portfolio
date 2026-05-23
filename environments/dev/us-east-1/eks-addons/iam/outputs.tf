output "argocd_role_arn" {
  description = "ARN of the ArgoCD IRSA role"
  value       = module.argocd_role.role_arn
}

output "karpenter_role_arn" {
  description = "ARN of the Karpenter IRSA role"
  value       = module.karpenter_role.role_arn
}