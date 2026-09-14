terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
required_version = ">= 1.6.0"
}


provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "web" {
ami           = "ami-00244c37cc386a210"
instance_type = var.instance_type

tags = {
Name = "terraform-web"
}
}
