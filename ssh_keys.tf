# SSH Keys

# Import existing SSH key
import {
  to = digitalocean_ssh_key.main
  id = "38542761"
}

resource "digitalocean_ssh_key" "main" {
  name       = "id_rsa"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCk/NG8BmXIYKPiBFTLtTU484kHFo9K+xgIzHQiTyxm0edgNPJ/xRgqzsJEoQAIAwXeIxe+MlFofgPaX9QDvbcuucRTD94MeNYHAV4uwV7Q8uY4a5QjG4sv2y/kl3nltlp5ciWfbHx59EfUhG3KXGWQIt1gy/mNUHReNcTTzVwNYsIbJRHuk/vra7LonKT2Ck7mm89c0OU2aIsqNrhfTxgIPLbqP7H97DG3NPMgZTM3kxSzOZ6Efsh4QJo9MvoKPt/frq+rNyfVHUi4/j2k5TwLcp3FyB/w0pNRG2/oOMxCocV3A3ZkIlY4yQnj6qO7FpoP5PS6CYBZWlpV62QmtDwl4nxIK0nxHKk1rXqZg/DoqTGqbDSbrvth0NRT7mGpumuyHoR94Qf1kh4WTNEoRthodZOBtSHbspgHPfL/Ah+41oJPfz42MtG/DeKhjOBZfpyg06eq6y/SOjUxZBgLP0uJPKxo0QMLvyH+0sYjuSBtYclwV3pa5GDV2I1P5NBE6+8= chris@DESKTOP-9LLK847"
}
