output "argocd_namespace" {
  description = "Namespace ArgoCD is deployed into"
  value       = helm_release.argocd.namespace
}

output "argocd_version" {
  description = "Deployed ArgoCD Helm chart version"
  value       = helm_release.argocd.version
}

output "argocd_status" {
  description = "Status of the ArgoCD Helm release"
  value       = helm_release.argocd.status
}