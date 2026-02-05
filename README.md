# HomeIaC

Infrastructure as Code for home infrastructure using Terraform. Manages DigitalOcean resources and Kubernetes deployments.

## Overview

This repository contains two separate Terraform deployments:

- **infrastructure/** - DigitalOcean resources (K8s cluster, database, droplets, networking)
- **kubernetes/** - Kubernetes resources (Helm releases, ingresses, certificates)

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        DigitalOcean                             │
│  ┌─────────────────┐  ┌─────────────────┐  ┌────────────────┐  │
│  │  K8s Cluster    │  │  MySQL Database │  │ Ubuntu Droplet │  │
│  │  (sfo3)         │  │  (sfo2)         │  │ (sfo3)         │  │
│  │                 │  │                 │  │                │  │
│  │  ┌───────────┐  │  │  - adhd         │  └────────────────┘  │
│  │  │ ingress-  │  │  │  - chcom        │                      │
│  │  │ nginx     │  │  │  - joonuper     │  ┌────────────────┐  │
│  │  ├───────────┤  │  │  - mchugh       │  │  Load Balancer │  │
│  │  │ cert-     │  │  │  - rtu          │  │  (K8s managed) │  │
│  │  │ manager   │  │  └─────────────────┘  └────────────────┘  │
│  │  ├───────────┤  │                                           │
│  │  │ argocd    │  │  ┌─────────────────┐                      │
│  │  ├───────────┤  │  │  VPC: k8s-sfo3  │                      │
│  │  │ WordPress │  │  │  10.124.16.0/20 │                      │
│  │  │ (x5)      │  │  └─────────────────┘                      │
│  │  └───────────┘  │                                           │
│  └─────────────────┘                                           │
└─────────────────────────────────────────────────────────────────┘
```

## Repository Structure

```
homeiac/
├── infrastructure/           # DigitalOcean resources
│   ├── main.tf              # Terraform config, S3 backend
│   ├── providers.tf         # DigitalOcean provider
│   ├── variables.tf         # Input variables (do_token)
│   ├── outputs.tf           # Output values
│   ├── database.tf          # MySQL cluster
│   ├── droplets.tf          # Standalone droplet
│   ├── kubernetes.tf        # K8s cluster + node pool
│   ├── networking.tf        # VPC
│   ├── project.tf           # DO project
│   └── ssh_keys.tf          # SSH keys
├── kubernetes/              # Kubernetes resources
│   ├── main.tf              # Terraform config, S3 backend
│   ├── providers.tf         # Kubernetes + Helm providers
│   ├── variables.tf         # Input variables
│   ├── outputs.tf           # Output values
│   ├── namespaces.tf        # K8s namespaces
│   ├── helm-infrastructure.tf  # ingress-nginx, cert-manager, argocd
│   ├── helm-wordpress.tf    # WordPress releases (x5)
│   ├── cluster-issuer.tf    # Let's Encrypt ClusterIssuer
│   └── ingresses.tf         # WordPress ingresses with TLS
└── .github/workflows/
    ├── terraform-infrastructure.yml
    └── terraform-kubernetes.yml
```

## Prerequisites

- [Terraform](https://www.terraform.io/downloads) >= 1.5.0
- [doctl](https://docs.digitalocean.com/reference/doctl/) (DigitalOcean CLI)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- AWS credentials (for S3 state backend)
- DigitalOcean API token

## Running Locally

### Infrastructure Deployment

```bash
cd infrastructure

# Set environment variables
export AWS_ACCESS_KEY_ID="your-aws-access-key"
export AWS_SECRET_ACCESS_KEY="your-aws-secret-key"
export TF_VAR_do_token="your-digitalocean-token"

# Initialize and plan
terraform init
terraform plan

# Apply changes (requires confirmation)
terraform apply
```

### Kubernetes Deployment

```bash
cd kubernetes

# Set environment variables
export AWS_ACCESS_KEY_ID="your-aws-access-key"
export AWS_SECRET_ACCESS_KEY="your-aws-secret-key"

# MySQL passwords for WordPress sites
export TF_VAR_mysql_password_mchugh="password"
export TF_VAR_mysql_password_adhd="password"
export TF_VAR_mysql_password_chcom="password"
export TF_VAR_mysql_password_joonuper="password"
export TF_VAR_mysql_password_rtu="password"

# Ensure kubeconfig is set up
doctl kubernetes cluster kubeconfig save k8s-1-20-2-do-0-sfo3-1615763002107

# Initialize and plan
terraform init
terraform plan

# Apply changes (requires confirmation)
terraform apply
```

## State Management

Terraform state is stored in S3:

| Deployment | State Key |
|------------|-----------|
| infrastructure | `homeiac/infrastructure.tfstate` |
| kubernetes | `homeiac/kubernetes.tfstate` |

## CI/CD

GitHub Actions workflows run on pushes and PRs to `main`:

- **terraform-infrastructure.yml** - Triggered by changes in `infrastructure/`
- **terraform-kubernetes.yml** - Triggered by changes in `kubernetes/`

Both workflows run `terraform plan` and post results as PR comments.

### Required GitHub Secrets

| Secret | Description |
|--------|-------------|
| `DIGITALOCEAN_API_TOKEN` | DigitalOcean API token (full access) |
| `AWS_ACCESS_KEY_ID` | AWS access key for S3 state |
| `AWS_SECRET_ACCESS_KEY` | AWS secret key for S3 state |
| `MYSQL_PASSWORD_MCHUGH` | MySQL password for mchugh database |
| `MYSQL_PASSWORD_ADHD` | MySQL password for adhd database |
| `MYSQL_PASSWORD_CHCOM` | MySQL password for chcom database |
| `MYSQL_PASSWORD_JOONUPER` | MySQL password for joonuper database |
| `MYSQL_PASSWORD_RTU` | MySQL password for rtu database |

## WordPress Sites

| Site | Domain | Database |
|------|--------|----------|
| mchugh | mchughanalytics.com | mchugh |
| adhd | theadhddad.com | adhd |
| chcom | christopherhayles.com | chcom |
| joonuper | joonuper.com | joonuper |
| rtu | remarkabletabletuser.com | rtu |

All WordPress sites use:
- Bitnami WordPress Helm chart
- External MySQL database (DigitalOcean managed)
- TLS certificates via cert-manager (Let's Encrypt)
- Ingress via ingress-nginx
