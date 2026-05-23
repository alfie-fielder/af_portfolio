# ADR-003: Karpenter Deployment Split

## Status
Accepted

## Date
2026-05-23

## Context
Karpenter has two distinct components with different concerns:

1. The **controller** — a Kubernetes deployment that runs in the cluster and
   watches for pending pods to provision nodes for
2. **NodePool and EC2NodeClass** resources — Kubernetes CRDs that define what
   kinds of nodes Karpenter should provision

The question is whether both components should be managed by Terraform or split
across Terraform and GitOps.

## Decision
The Karpenter controller is deployed via Terraform `helm_release` in
`eks-addons/karpenter/`. NodePool and EC2NodeClass resources are managed by
ArgoCD in `af_portfolio_platform`.

## Rationale
- The controller is infrastructure — it requires the EKS cluster to exist first
  and is a prerequisite for node provisioning. This makes it a Terraform concern.
- NodePool and EC2NodeClass are platform configuration — they define node
  behaviour and should be GitOps-managed so changes go through version control
  and can be reviewed via PR.
- Splitting the two means node configuration can be updated without a Terraform
  apply, reducing operational overhead.
- Consistent with the principle that Terraform owns infrastructure primitives and
  ArgoCD owns platform and application config.

## Consequences
- Karpenter controller version is pinned in `terraform.tfvars` and bumped manually
- NodePool and EC2NodeClass changes are made via PRs to `af_portfolio_platform`
- A dependency exists: the controller must be running before ArgoCD can
  successfully sync the NodePool/EC2NodeClass manifests