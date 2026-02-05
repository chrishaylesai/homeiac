# DigitalOcean Project

# Import existing project
import {
  to = digitalocean_project.main
  id = "5e79dd09-8d1b-4dbf-bec6-9dc89231f96d"
}

resource "digitalocean_project" "main" {
  name        = "Chris"
  description = "Update your project information under Settings"
  is_default  = true
}
