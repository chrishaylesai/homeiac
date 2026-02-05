# Kubernetes cluster

import {
  to = digitalocean_kubernetes_cluster.main
  id = "e3ca5d5a-113d-4e2e-a238-5103306962fa"
}

resource "digitalocean_kubernetes_cluster" "main" {
  name    = "k8s-1-20-2-do-0-sfo3-1615763002107"
  region  = "sfo3"
  version = "1.32.10-do.2"

  vpc_uuid = digitalocean_vpc.k8s.id

  node_pool {
    name       = "pool-otsgzwofw"
    size       = "s-2vcpu-4gb"
    node_count = 2
    tags       = ["terraform:default-node-pool"]
  }

  maintenance_policy {
    start_time = "09:00"
    day        = "any"
  }

  tags = ["k8s", "kubernetes", "wordpress"]
}
