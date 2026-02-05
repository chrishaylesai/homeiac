# WordPress Ingress resources with TLS

locals {
  ingress_annotations = {
    "kubernetes.io/ingress.class"              = "nginx"
    "cert-manager.io/cluster-issuer"           = "letsencrypt-prod"
    "nginx.ingress.kubernetes.io/proxy-body-size" = "8m"
  }
}

# mchugh ingress
resource "kubernetes_ingress_v1" "mchugh" {
  metadata {
    name        = "mchugh"
    namespace   = kubernetes_namespace.wordpress.metadata[0].name
    annotations = local.ingress_annotations
  }

  spec {
    rule {
      host = "mchughanalytics.com"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "mchugh-wordpress"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    rule {
      host = "www.mchughanalytics.com"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "mchugh-wordpress"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    tls {
      hosts       = ["mchughanalytics.com"]
      secret_name = "mchugh-tls"
    }

    tls {
      hosts       = ["www.mchughanalytics.com"]
      secret_name = "mchugh-tls-2"
    }
  }

  depends_on = [helm_release.wordpress_mchugh]
}

# adhd ingress
resource "kubernetes_ingress_v1" "adhd" {
  metadata {
    name        = "adhd"
    namespace   = kubernetes_namespace.wordpress.metadata[0].name
    annotations = local.ingress_annotations
  }

  spec {
    rule {
      host = "theadhddad.com"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "adhd-wordpress"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    rule {
      host = "www.theadhddad.com"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "adhd-wordpress"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    tls {
      hosts       = ["theadhddad.com"]
      secret_name = "adhd-tls"
    }

    tls {
      hosts       = ["www.theadhddad.com"]
      secret_name = "adhd-tls-2"
    }
  }

  depends_on = [helm_release.wordpress_adhd]
}

# chcom ingress
resource "kubernetes_ingress_v1" "chcom" {
  metadata {
    name        = "chcom"
    namespace   = kubernetes_namespace.wordpress.metadata[0].name
    annotations = local.ingress_annotations
  }

  spec {
    rule {
      host = "christopherhayles.com"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "chcom-wordpress"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    rule {
      host = "www.christopherhayles.com"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "chcom-wordpress"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    tls {
      hosts       = ["christopherhayles.com"]
      secret_name = "chcom-tls"
    }

    tls {
      hosts       = ["www.christopherhayles.com"]
      secret_name = "chcom-tls-2"
    }
  }

  depends_on = [helm_release.wordpress_chcom]
}

# joonuper ingress
resource "kubernetes_ingress_v1" "joonuper" {
  metadata {
    name        = "joonuper"
    namespace   = kubernetes_namespace.wordpress.metadata[0].name
    annotations = local.ingress_annotations
  }

  spec {
    rule {
      host = "joonuper.com"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "joonuper-wordpress"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    rule {
      host = "www.joonuper.com"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "joonuper-wordpress"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    tls {
      hosts       = ["joonuper.com"]
      secret_name = "joonuper-tls"
    }

    tls {
      hosts       = ["www.joonuper.com"]
      secret_name = "joonuper-tls-2"
    }
  }

  depends_on = [helm_release.wordpress_joonuper]
}

# rtu ingress
resource "kubernetes_ingress_v1" "rtu" {
  metadata {
    name        = "rtu"
    namespace   = kubernetes_namespace.wordpress.metadata[0].name
    annotations = local.ingress_annotations
  }

  spec {
    rule {
      host = "remarkabletabletuser.com"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "rtu-wordpress"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    rule {
      host = "www.remarkabletabletuser.com"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "rtu-wordpress"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    rule {
      host = "blog.remarkabletabletuser.com"
      http {
        path {
          path      = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "rtu-wordpress"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    tls {
      hosts       = ["remarkabletabletuser.com"]
      secret_name = "rtu-tls"
    }

    tls {
      hosts       = ["www.remarkabletabletuser.com"]
      secret_name = "rtu-tls-2"
    }

    tls {
      hosts       = ["blog.remarkabletabletuser.com"]
      secret_name = "rtu-tls-3"
    }
  }

  depends_on = [helm_release.wordpress_rtu]
}
