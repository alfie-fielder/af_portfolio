cluster_name       = "af-portfolio-dev"
kubernetes_version = "1.29"
aws_region         = "us-east-1"
public_endpoint    = true

node_groups = {
  general = {
    instance_types = ["t3.medium"]
    capacity_type  = "ON_DEMAND"
    desired_size   = 2
    min_size       = 1
    max_size       = 3
  }
}

addons = {
  vpc-cni    = { version = "v1.18.1-eksbuild.1" }
  coredns    = { version = "v1.11.1-eksbuild.8" }
  kube-proxy = { version = "v1.29.3-eksbuild.2" }
}

tags = {
  Environment = "dev"
  Region      = "us-east-1"
  ManagedBy   = "terraform"
  Project     = "af-portfolio"
}