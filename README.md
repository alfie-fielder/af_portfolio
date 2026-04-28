# af_portfolio

A portfolio repository demonstrating AWS infrastructure management using Terraform, with a focus on real-world production patterns.

## Structure
environments/
    dev/
        us-east-1/
            vpc/
        us-east-2/
            vpc/
    prod/
        us-east-1/
            vpc/
        us-east-2/
            vpc/
docs/
    adr/
        001-environment-isolation.md

## Design Decisions

Environments are intentionally isolated as separate Terraform roots rather than sharing a single root module with per-environment tfvars. See [ADR-001](docs/adr/001-environment-isolation.md) for the full rationale.

## Modules

Infrastructure is built on top of versioned, reusable modules:
- [`af_portfolio_modules`](https://github.com/alfie-fielder/af_portfolio_modules)
- [`af_portfolio_vpc_module`](https://github.com/alfie-fielder/af_portfolio_vpc_module)
- [`af_portfolio_ec2_module`](https://github.com/alfie-fielder/af_portfolio_ec2_module)

VPC and EC2 are maintained as dedicated module repositories due to their nature of requiring independent versioning across environments, dev and prod may pin to different module versions as changes are validated, which is easier to manage when the module has its own release history.

Other shared modules are consolidated into `af_portfolio_modules` to keep this portfolio manageable. In a production environment the natural evolution of this would be a dedicated repository per module, giving each its own versioning, changelog, and CI pipeline.