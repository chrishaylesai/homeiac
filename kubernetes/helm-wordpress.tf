# WordPress Helm releases
# All sites use Bitnami WordPress chart with external MySQL database

locals {
  wordpress_common = {
    repository = "https://charts.bitnami.com/bitnami"
    chart      = "wordpress"
    version    = "28.1.5"
  }

  # Common WordPress configuration
  wordpress_defaults = {
    "mariadb.enabled"                = "false"
    "service.type"                   = "ClusterIP"
    "persistence.enabled"            = "true"
    "resources.requests.cpu"         = "300m"
    "resources.requests.memory"      = "512Mi"
    "externalDatabase.host"          = var.mysql_host
    "externalDatabase.port"          = var.mysql_port
    "image.registry"                 = "docker.io"
    "image.repository"               = "bitnamilegacy/wordpress"
    "image.tag"                      = "6.8.2-debian-12-r5"
  }
}

# mchugh - mchughanalytics.com
resource "helm_release" "wordpress_mchugh" {
  name       = "mchugh"
  namespace  = kubernetes_namespace.wordpress.metadata[0].name
  repository = local.wordpress_common.repository
  chart      = local.wordpress_common.chart
  version    = local.wordpress_common.version

  dynamic "set" {
    for_each = local.wordpress_defaults
    content {
      name  = set.key
      value = set.value
    }
  }

  set {
    name  = "wordpressBlogName"
    value = "McHugh Analytics"
  }

  set {
    name  = "wordpressEmail"
    value = "chris@mchughanalytics.com"
  }

  set {
    name  = "wordpressFirstName"
    value = "Christopher"
  }

  set {
    name  = "wordpressLastName"
    value = "McHugh"
  }

  set {
    name  = "wordpressUsername"
    value = "chris"
  }

  set {
    name  = "externalDatabase.database"
    value = "mchugh"
  }

  set {
    name  = "externalDatabase.user"
    value = "mchugh"
  }

  set_sensitive {
    name  = "externalDatabase.password"
    value = var.mysql_password_mchugh
  }

  set {
    name  = "persistence.existingClaim"
    value = "mchugh-wordpress"
  }
}

# adhd - theadhddad.com
resource "helm_release" "wordpress_adhd" {
  name       = "adhd"
  namespace  = kubernetes_namespace.wordpress.metadata[0].name
  repository = local.wordpress_common.repository
  chart      = local.wordpress_common.chart
  version    = local.wordpress_common.version

  dynamic "set" {
    for_each = local.wordpress_defaults
    content {
      name  = set.key
      value = set.value
    }
  }

  set {
    name  = "wordpressBlogName"
    value = "The ADHD Dad"
  }

  set {
    name  = "wordpressEmail"
    value = "chris@theadhddad.com"
  }

  set {
    name  = "wordpressFirstName"
    value = "Christopher"
  }

  set {
    name  = "wordpressLastName"
    value = "McHugh"
  }

  set {
    name  = "wordpressUsername"
    value = "chris"
  }

  set {
    name  = "externalDatabase.database"
    value = "adhd"
  }

  set {
    name  = "externalDatabase.user"
    value = "adhddad"
  }

  set_sensitive {
    name  = "externalDatabase.password"
    value = var.mysql_password_adhd
  }

  set {
    name  = "persistence.existingClaim"
    value = "adhd-wordpress"
  }
}

# chcom - christopherhayles.com
resource "helm_release" "wordpress_chcom" {
  name       = "chcom"
  namespace  = kubernetes_namespace.wordpress.metadata[0].name
  repository = local.wordpress_common.repository
  chart      = local.wordpress_common.chart
  version    = local.wordpress_common.version

  dynamic "set" {
    for_each = local.wordpress_defaults
    content {
      name  = set.key
      value = set.value
    }
  }

  set {
    name  = "wordpressBlogName"
    value = "Christopher Hayles"
  }

  set {
    name  = "wordpressEmail"
    value = "chris@christopherhayles.com"
  }

  set {
    name  = "wordpressFirstName"
    value = "Christopher"
  }

  set {
    name  = "wordpressLastName"
    value = "Hayles"
  }

  set {
    name  = "wordpressUsername"
    value = "chris"
  }

  set {
    name  = "externalDatabase.database"
    value = "chcom"
  }

  set {
    name  = "externalDatabase.user"
    value = "chcom"
  }

  set_sensitive {
    name  = "externalDatabase.password"
    value = var.mysql_password_chcom
  }

  set {
    name  = "persistence.existingClaim"
    value = "chcom-wordpress"
  }
}

# joonuper - joonuper.com
resource "helm_release" "wordpress_joonuper" {
  name       = "joonuper"
  namespace  = kubernetes_namespace.wordpress.metadata[0].name
  repository = local.wordpress_common.repository
  chart      = local.wordpress_common.chart
  version    = local.wordpress_common.version

  dynamic "set" {
    for_each = local.wordpress_defaults
    content {
      name  = set.key
      value = set.value
    }
  }

  set {
    name  = "wordpressBlogName"
    value = "Joonuper"
  }

  set {
    name  = "wordpressEmail"
    value = "chris@joonuper.com"
  }

  set {
    name  = "wordpressFirstName"
    value = "Christopher"
  }

  set {
    name  = "wordpressLastName"
    value = "McHugh"
  }

  set {
    name  = "wordpressUsername"
    value = "chris"
  }

  set {
    name  = "externalDatabase.database"
    value = "joonuper"
  }

  set {
    name  = "externalDatabase.user"
    value = "joonuper"
  }

  set_sensitive {
    name  = "externalDatabase.password"
    value = var.mysql_password_joonuper
  }

  set {
    name  = "persistence.existingClaim"
    value = "joonuper-wordpress"
  }
}

# rtu - remarkabletabletuser.com
resource "helm_release" "wordpress_rtu" {
  name       = "rtu"
  namespace  = kubernetes_namespace.wordpress.metadata[0].name
  repository = local.wordpress_common.repository
  chart      = local.wordpress_common.chart
  version    = local.wordpress_common.version

  dynamic "set" {
    for_each = local.wordpress_defaults
    content {
      name  = set.key
      value = set.value
    }
  }

  set {
    name  = "wordpressBlogName"
    value = "ReMarkableTabletUser"
  }

  set {
    name  = "wordpressEmail"
    value = "chris@remarkabletabletuser.com"
  }

  set {
    name  = "wordpressFirstName"
    value = "Christopher"
  }

  set {
    name  = "wordpressLastName"
    value = "McHugh"
  }

  set {
    name  = "wordpressUsername"
    value = "chris"
  }

  set {
    name  = "externalDatabase.database"
    value = "rtu"
  }

  set {
    name  = "externalDatabase.user"
    value = "rtublog"
  }

  set_sensitive {
    name  = "externalDatabase.password"
    value = var.mysql_password_rtu
  }

  set {
    name  = "persistence.existingClaim"
    value = "rtu-wordpress"
  }
}
