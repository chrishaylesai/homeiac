# Database resources

# Import existing MySQL database cluster
import {
  to = digitalocean_database_cluster.mysql
  id = "43eeeaba-270a-4e37-b3f6-936dfcf88440"
}

resource "digitalocean_database_cluster" "mysql" {
  name       = "db-mysql-sfo2-35094"
  engine     = "mysql"
  version    = "8"
  size       = "db-s-1vcpu-1gb"
  region     = "sfo2"
  node_count = 1

  private_network_uuid = "b726a957-7d65-461a-8f52-e515656fde65"

  maintenance_window {
    day  = "tuesday"
    hour = "17:00"
  }

  tags = ["wordpress"]
}

# Note: Database users and databases are not imported here as they may contain
# sensitive data and are often managed separately. They can be added if needed:
#
# resource "digitalocean_database_db" "example" {
#   cluster_id = digitalocean_database_cluster.mysql.id
#   name       = "example"
# }
#
# Existing databases: adhd, chcom, defaultdb, joonuper, mchugh, rtu
# Existing users: adhddad, chcom, doadmin, joonuper, mchugh, rtublog
