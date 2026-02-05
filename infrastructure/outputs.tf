# Output values

# Kubernetes
output "k8s_endpoint" {
  description = "Kubernetes cluster API endpoint"
  value       = digitalocean_kubernetes_cluster.main.endpoint
}

output "k8s_cluster_id" {
  description = "Kubernetes cluster ID"
  value       = digitalocean_kubernetes_cluster.main.id
}

# Database
output "database_host" {
  description = "MySQL database host"
  value       = digitalocean_database_cluster.mysql.host
}

output "database_private_host" {
  description = "MySQL database private host"
  value       = digitalocean_database_cluster.mysql.private_host
}

output "database_port" {
  description = "MySQL database port"
  value       = digitalocean_database_cluster.mysql.port
}

# Droplet
output "droplet_ip" {
  description = "Ubuntu droplet public IP"
  value       = digitalocean_droplet.ubuntu.ipv4_address
}

output "droplet_private_ip" {
  description = "Ubuntu droplet private IP"
  value       = digitalocean_droplet.ubuntu.ipv4_address_private
}

# VPC
output "k8s_vpc_id" {
  description = "Kubernetes VPC ID"
  value       = digitalocean_vpc.k8s.id
}
