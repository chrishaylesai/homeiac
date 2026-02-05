# Input variables

variable "kubeconfig_path" {
  description = "Path to kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

# Let's Encrypt
variable "letsencrypt_email" {
  description = "Email for Let's Encrypt certificate notifications"
  type        = string
  default     = "chris@mchughanalytics.com"
}

# MySQL database connection
variable "mysql_host" {
  description = "MySQL database host"
  type        = string
  default     = "private-db-mysql-sfo2-35094-do-user-8007345-0.b.db.ondigitalocean.com"
}

variable "mysql_port" {
  description = "MySQL database port"
  type        = string
  default     = "25060"
}

# MySQL passwords for WordPress sites
variable "mysql_password_mchugh" {
  description = "MySQL password for mchugh database"
  type        = string
  sensitive   = true
}

variable "mysql_password_adhd" {
  description = "MySQL password for adhd database"
  type        = string
  sensitive   = true
}

variable "mysql_password_chcom" {
  description = "MySQL password for chcom database"
  type        = string
  sensitive   = true
}

variable "mysql_password_joonuper" {
  description = "MySQL password for joonuper database"
  type        = string
  sensitive   = true
}

variable "mysql_password_rtu" {
  description = "MySQL password for rtu database"
  type        = string
  sensitive   = true
}
