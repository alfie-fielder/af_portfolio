resource "helm_release" "karpenter" {
  name             = "karpenter"
  repository       = "https://charts.karpenter.sh"
  chart            = "karpenter"
  namespace        = "karpenter"
  create_namespace = true
  version          = var.karpenter_chart_version

  values = [
    templatefile("${path.module}/values/karpenter-values.yaml", {
      karpenter_role_arn = data.terraform_remote_state.iam.outputs.karpenter_role_arn
      cluster_name       = data.terraform_remote_state.eks.outputs.cluster_name
      cluster_endpoint   = data.terraform_remote_state.eks.outputs.cluster_endpoint
    })
  ]
}