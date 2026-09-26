output "ip" {
  value = aws_instance.ec2.public_ip
}

output "publicName" {
  value = aws_instance.ec2.public_dns
}
