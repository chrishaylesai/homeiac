# Output values

# Namespaces
output "namespace_wordpress" {
  description = "WordPress namespace"
  value       = kubernetes_namespace.wordpress.metadata[0].name
}

output "namespace_ingress_nginx" {
  description = "ingress-nginx namespace"
  value       = kubernetes_namespace.ingress_nginx.metadata[0].name
}

output "namespace_cert_manager" {
  description = "cert-manager namespace"
  value       = kubernetes_namespace.cert_manager.metadata[0].name
}

output "namespace_argocd" {
  description = "ArgoCD namespace"
  value       = kubernetes_namespace.argocd.metadata[0].name
}

# Helm release status
output "helm_ingress_nginx_status" {
  description = "ingress-nginx Helm release status"
  value       = helm_release.ingress_nginx.status
}

output "helm_cert_manager_status" {
  description = "cert-manager Helm release status"
  value       = helm_release.cert_manager.status
}

output "helm_argocd_status" {
  description = "ArgoCD Helm release status"
  value       = helm_release.argocd.status
}

# WordPress sites
output "wordpress_sites" {
  description = "WordPress site names"
  value = [
    helm_release.wordpress_mchugh.name,
    helm_release.wordpress_adhd.name,
    helm_release.wordpress_chcom.name,
    helm_release.wordpress_joonuper.name,
    helm_release.wordpress_rtu.name,
  ]
}
