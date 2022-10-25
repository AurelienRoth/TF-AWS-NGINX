variable ami {}
variable subnet_id {}
variable vpc_security_group_ids {
  type = list
}
variable identity {}
variable key_name {}
variable private_key {}

resource "aws_instance" "web_nginx" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name = var.key_name
  tags = {
    "Identity"    = var.identity
    "Name"        = "web_nginx"
    "Environment" = "training"
  }

  connection {
    user = var.identity #"bitnami"
    private_key = var.private_key
    host = self.public_ip
  }

#  provisioner "file" {
#    source = "assets"
#    destination = "/tmp/"
#  }

#  provisioner "remote-exec" {
#    inline = [
#      "sudo sh /tmp/assets/setup-web.sh"
#    ]
#  }

}
output "public_ip" {
  value = aws_instance.web_nginx.public_ip
}
output "public_dns" {
  value = aws_instance.web_nginx.public_dns
}
