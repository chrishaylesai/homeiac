# Networking resources (VPCs)

# Import the custom K8s VPC
import {
  to = digitalocean_vpc.k8s
  id = "bd8c4b9b-ee5c-4fde-a326-d9fd95bbc5e5"
}

resource "digitalocean_vpc" "k8s" {
  name        = "k8s-sf03-vpc"
  region      = "sfo3"
  ip_range    = "10.124.16.0/20"
  description = "VPC for Kubernetes cluster"
}
