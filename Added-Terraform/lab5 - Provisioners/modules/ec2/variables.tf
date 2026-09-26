
variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "environment" {
  type = string
}

variable "key_pair" {
  type = string
}