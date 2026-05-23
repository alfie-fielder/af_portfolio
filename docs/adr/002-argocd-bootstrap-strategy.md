# ADR-002: ArgoCD Bootstrap Strategy

## Status
Accepted

## Date
2026-05-23

## Context
ArgoCD needs to be installed onto the EKS cluster before it can manage any platform
or application workloads. The question is how the initial installation is handled and
whether Terraform should continue to manage ArgoCD's configuration after the initial
install.

Two options were considered:

1. Bootstrap and ongoing management via Terraform helm_release
2. Bootstrap via Terraform helm_release, self-manage thereafter via GitOps

## Decision
ArgoCD is bootstrapped via a Terraform `helm_release` resource in
`eks-addons/argocd/`. After the initial install, Terraform creates a root Application
manifest pointing at the `af_portfolio_platform` repo. From that point, ArgoCD
self-manages — any changes to ArgoCD configuration are made via GitOps in
`af_portfolio_platform`, not via Terraform.

## Rationale
- Keeps the bootstrap reproducible and version-controlled in Terraform
- Avoids Terraform needing to reconcile ArgoCD internals on every apply
- ArgoCD managing itself via GitOps is the intended and well-supported pattern
- Reduces the blast radius of Terraform applies — a broken Terraform run cannot
  accidentally misconfigure a running ArgoCD instance

## Consequences
- ArgoCD chart version is pinned in `terraform.tfvars` and bumped manually
- ArgoCD configuration beyond the initial install lives in `af_portfolio_platform`
- Two sources of truth exist during bootstrap (Terraform + Git) but converge
  immediately after the root Application is created