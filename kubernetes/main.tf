# Home Infrastructure as Code
# Kubernetes deployment - Helm releases and K8s resources

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }

  backend "s3" {
    bucket = "hayles-test-terraform-us-west-2"
    key    = "homeiac/kubernetes.tfstate"
    region = "us-west-2"
    # Credentials via AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY env vars
  }
}
