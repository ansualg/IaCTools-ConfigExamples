provider "local" {}
resource "null_resource" "ubuntu_server" {
	connection {
		type = "ssh"
		user = "ubuntu"
		private_key = file
		host = "10.0.0.1"
	}
	provisioner "remote-exec" {
		inline = [
		"sudo apt-get update",
		"sudo apt-get install -y openssh-server"
		]
	}
}
