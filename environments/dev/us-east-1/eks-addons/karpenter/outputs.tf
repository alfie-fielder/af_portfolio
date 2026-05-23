output "karpenter_namespace" {
  description = "Namespace Karpenter is deployed into"
  value       = helm_release.karpenter.namespace
}

output "karpenter_version" {
  description = "Deployed Karpenter Helm chart version"
  value       = helm_release.karpenter.version
}

output "karpenter_status" {
  description = "Status of the Karpenter Helm release"
  value       = helm_release.karpenter.status
}