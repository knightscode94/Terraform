provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.type
}
