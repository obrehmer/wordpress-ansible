output "droplet_ip" {
  description = "Public IPv4 address of the stage droplet"
  value       = digitalocean_droplet.tst.ipv4_address
}

