# Standalone Droplets (not managed by Kubernetes)

# Import existing standalone Ubuntu droplet
import {
  to = digitalocean_droplet.ubuntu
  id = "506126967"
}

resource "digitalocean_droplet" "ubuntu" {
  name   = "ubuntu-s-2vcpu-4gb-sfo3-01"
  region = "sfo3"
  size   = "s-2vcpu-4gb"
  image  = "ubuntu-24-10-x64"

  vpc_uuid   = "058b3176-b721-4512-8df4-6c7056fea408"
  monitoring = true

  lifecycle {
    ignore_changes = [image, ssh_keys]
  }
}
