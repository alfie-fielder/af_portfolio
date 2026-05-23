#ArgoCD IAM Role and Policy
data "aws_iam_policy_document" "argocd_trust" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [data.terraform_remote_state.eks.outputs.oidc_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${trimprefix(data.terraform_remote_state.eks.outputs.oidc_provider_url, "https://")}:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "${trimprefix(data.terraform_remote_state.eks.outputs.oidc_provider_url, "https://")}:sub"
      values   = ["system:serviceaccount:argocd:argocd-server"]
    }
  }
}

module "argocd_policy" {
    source = "github.com/alfie-fielder/af_portfolio_modules//iam-policy?ref=main"

    policy_name = var.argocd_policy_name
    policy_file_path = var.argocd_file_path
    description = var.argocd_policy_description
    
    tags = merge(var.tags, var.argocd_tags)
}

module "argocd_role" {
    source = "github.com/alfie-fielder/af_portfolio_modules//iam-role?ref=main"

    role_name = var.argocd_role_name
    path = var.argocd_role_path
    assume_role_policy = data.aws_iam_policy_document.argocd_trust.json
    description = var.argocd_role_description

    policy_arns = [module.argocd_policy.policy_arn]
    max_session_duration = var.argocd_role_max_session_duration
}


#Karpenter IAM Role and Policy
data "aws_iam_policy_document" "karpenter_trust" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [data.terraform_remote_state.eks.outputs.oidc_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${trimprefix(data.terraform_remote_state.eks.outputs.oidc_provider_url, "https://")}:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "${trimprefix(data.terraform_remote_state.eks.outputs.oidc_provider_url, "https://")}:sub"
      values   = ["system:serviceaccount:karpenter:karpenter"]
    }
  }
}

module "karpenter_policy" {
    source = "github.com/alfie-fielder/af_portfolio_modules//iam-policy?ref=main"

    policy_name = var.karpenter_policy_name
    policy_file_path = var.karpenter_file_path
    description = var.karpenter_policy_description

    tags = merge(var.tags, var.karpenter_tags)
}

module "karpenter_role" {
    source = "github.com/alfie-fielder/af_portfolio_modules//iam-role?ref=main"

    role_name = var.karpenter_role_name
    path = var.karpenter_role_path
    assume_role_policy = data.aws_iam_policy_document.karpenter_trust.json
    description = var.karpenter_role_description

    policy_arns = [module.karpenter_policy.policy_arn]
    max_session_duration = var.karpenter_role_max_session_duration
}
