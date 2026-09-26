terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "> 0.12"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "ec2" {
  ami               = "${var.ami_id}"
  instance_type     = "${var.instance_type}"
  
  tags = {
    Name = "HelloWorld"
  }
       
}
