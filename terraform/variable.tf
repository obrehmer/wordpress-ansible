variable "do_token" {
  type        = string
  description = "DigitalOcean API token"
  sensitive   = true
}

variable "ssh_fingerprint" {
  type        = string
  description = "SSH key fingerprint registered at DigitalOcean"
}

variable "droplet_image" {
  type    = string
  default = "ubuntu-24-10-x64"
}

variable "droplet_region" {
  type    = string
  default = "nyc1"
}

variable "droplet_size" {
  type    = string
  default = "s-2vcpu-4gb"
}

variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

variable "cloudflare_zone_id" {
  type = string
}

