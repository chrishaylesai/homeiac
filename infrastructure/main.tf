# Home Infrastructure as Code
# Infrastructure deployment - DigitalOcean resources

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

  backend "s3" {
    bucket = "hayles-test-terraform-us-west-2"
    key    = "homeiac/infrastructure.tfstate"
    region = "us-west-2"
    # Credentials via AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY env vars
  }
}
