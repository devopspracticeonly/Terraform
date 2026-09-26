
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_pair
  
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    host     = self.public_ip
    private_key = "${file("aws-demo-lin-mumbai.pem")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install php -y"
    ]
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo sh /tmp/script.sh"
    ]
  }

  tags = {
    Name = "HelloWorld"
    environment = var.environment
  }
}
