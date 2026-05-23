resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  version          = var.argocd_chart_version

  values = [
   templatefile("${path.module}/values/argocd-values.yaml", {
    argocd_role_arn = data.terraform_remote_state.argocd_iam.outputs.argocd_role_arn
   })
  ]
}