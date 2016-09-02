resource "digitalocean_droplet" "consul2" {
    image = "ubuntu-14-04-x64"
    name = "consul2"
    region = "nyc2"
    size = "512mb"
    private_networking = true
    ssh_keys = [
      "${var.ssh_fingerprint}"
    ]

connection {
      user = "root"
      type = "ssh"
      key_file = "${var.pvt_key}"
      timeout = "2m"
  }

provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "apt-get update"
    ]
  }
}

output "address_consul2" {
  value = "${digitalocean_droplet.consul2.ipv4_address}"
}

