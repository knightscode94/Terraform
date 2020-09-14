provider "aws" {
  region = "eu-west-1"
  alias  = "aws-ireland"
}


variable "ami-ireland" {
  description = "Machine image for Ireland"
  default     = "ami-..."
}

variable "type" {
  default = "t2.micro"
}

variable "zone" {
  description = "Map of availability zones for eu-west-1"
  default = {
    1 = "eu-west-1a"
    2 = "eu-west-1b"
  }
}


resource "aws_instance" "example_name" {
  provider          = "aws.aws-ireland"
  for_each          = var.zone   
  availability_zone = each.value 
  ami               = var.ami-ireland
  instance_type     = var.type

  lifecycle {
    prevent_destroy = false 
  }

  timeouts {
    create = "5m"
    delete = "2h"

  }
}