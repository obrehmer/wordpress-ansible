# terraform.stage/main.tf

terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "cloudflare_record" "stage_dns" {
  zone_id = var.cloudflare_zone_id
  name    = "testtempmail"
  type    = "A"
  content = digitalocean_droplet.tst.ipv4_address
  ttl     = 1
  proxied = true
}


provider "digitalocean" {
  token = var.do_token
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}


resource "digitalocean_droplet" "tst" {
  image    = var.droplet_image
  name     = "tst"
  region   = var.droplet_region
  size     = var.droplet_size
  ssh_keys = [var.ssh_fingerprint]
  tags     = ["stage"]

  # optional: destroy protection false
  backups    = false
  monitoring = true
}
