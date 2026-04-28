# ADR-001: Environment Isolation via Separate Terraform Roots

## Context

When managing infrastructure across multiple environments (dev, ,staging/uat, prod), there are two common approaches:

1. A single Terraform root module with per-environment variable files (`terraform apply -var-file=prod.tfvars`)
2. Separate Terraform root configurations per environment, each with its own state

## Decision

This repository uses **separate Terraform roots per environment**.

## Rationale

**Blast radius isolation** — a change to a shared `main.tf` affects all environments the moment it is applied. With separate roots, a misconfiguration in dev cannot propagate to prod without an explicit, separate apply.

**Natural state isolation** — each environment maintains its own state file with no risk of workspace misconfiguration or incorrect `-var-file` flags targeting the wrong environment in a CI/CD pipeline.

**Intentional drift** — environments legitimately diverge over time. Dev runs a newer module version than prod while changes are validated. Flow logs may be enabled in dev before prod. Forcing environments to share a root module creates friction around this natural and desirable drift.

**Audit clarity** — a pull request scoped to `environments/prod/` is unambiguously a production change. A PR to a shared `main.tf` requires careful review to understand which environments are affected.

## Trade-offs

The main cost of this approach is duplication — changes to the module call signature must be applied to each environment directory. This is considered an acceptable trade-off given the safety guarantees, and is mitigated by keeping environment configurations minimal (variables only, no logic).

## Alternatives Considered

- **Shared root + tfvars**: Simpler for small teams with uniform environments, but introduces shared failure modes and makes intentional environment drift harder to manage cleanly.
- **Terraform workspaces**: Discouraged for environment separation by HashiCorp's own guidance due to shared state backend and the risk of cross-workspace blast radius.