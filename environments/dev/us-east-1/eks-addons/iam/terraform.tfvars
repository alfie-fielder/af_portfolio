argocd_policy_name        = "af-portfolio-argocd-policy-dev"
argocd_file_path          = "./policies/argocd-ecr-policy.json"
argocd_policy_description = "IAM policy for ArgoCD ECR access"
argocd_role_name          = "af-portfolio-argocd-role-dev"
argocd_role_description   = "IRSA role for ArgoCD"

karpenter_policy_name        = "af-portfolio-karpenter-policy-dev"
karpenter_file_path          = "./policies/karpenter-policy.json"
karpenter_policy_description = "IAM policy for Karpenter node provisioning"
karpenter_role_name          = "af-portfolio-karpenter-role-dev"
karpenter_role_description   = "IRSA role for Karpenter"

tags = {
  Environment = "dev"
  Project     = "af-portfolio"
  ManagedBy   = "terraform"
}

argocd_tags = {
  Component = "argocd"
}

karpenter_tags = {
  Component = "karpenter"
}