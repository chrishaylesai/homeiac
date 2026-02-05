# Kubernetes cluster
#
# Note: The K8s cluster cannot be managed with a read-only API token.
# The DigitalOcean provider requires credentials access which needs write permissions.
#
# To manage this cluster with Terraform, use a token with write access and
# uncomment the configuration below.
#
# Cluster details:
#   ID: e3ca5d5a-113d-4e2e-a238-5103306962fa
#   Name: k8s-1-20-2-do-0-sfo3-1615763002107
#   Version: 1.32.10-do.2
#   Region: sfo3
#   VPC: k8s-sf03-vpc (bd8c4b9b-ee5c-4fde-a326-d9fd95bbc5e5)
#   Node Pool: pool-otsgzwofw (2 nodes, s-2vcpu-4gb)

# Uncomment with a write-enabled token:
#
# import {
#   to = digitalocean_kubernetes_cluster.main
#   id = "e3ca5d5a-113d-4e2e-a238-5103306962fa"
# }
#
# resource "digitalocean_kubernetes_cluster" "main" {
#   name    = "k8s-1-20-2-do-0-sfo3-1615763002107"
#   region  = "sfo3"
#   version = "1.32.10-do.2"
#
#   vpc_uuid = digitalocean_vpc.k8s.id
#
#   node_pool {
#     name       = "pool-otsgzwofw"
#     size       = "s-2vcpu-4gb"
#     node_count = 2
#     tags       = ["terraform:default-node-pool"]
#   }
#
#   maintenance_policy {
#     start_time = "09:00"
#     day        = "any"
#   }
#
#   tags = ["k8s", "kubernetes", "wordpress"]
# }
