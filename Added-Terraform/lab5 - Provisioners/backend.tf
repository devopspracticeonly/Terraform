terraform {
  backend "s3" {
    bucket = "tf-backend-s3-demo"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "tf-backend-s3-demo"
  }
}