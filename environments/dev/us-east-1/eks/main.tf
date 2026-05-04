module "eks" {
  source = "github.com/alfie-fielder/af_portfolio_modules//eks?ref=main"

  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version
  aws_region         = var.aws_region
  public_endpoint    = var.public_endpoint
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids         = data.terraform_remote_state.vpc.outputs.lan_subnet_ids
  node_groups        = var.node_groups
  addons             = var.addons
  tags               = var.tags
}