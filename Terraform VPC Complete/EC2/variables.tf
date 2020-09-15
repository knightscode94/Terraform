variable "ubuntu-ami" {
  description = "AMI ID of ubuntu 18.04LTS eu-west-1"
  default     = "ami-..."
}

variable "instance-type" {
  description = "Type of instance to be started up"
  default     = "t2.micro"
}

variable "pem-key" {
  description = "SSH Key Pair name"
  default     = "Gamers"
}

variable "subnet_id" {
  value = module.subnet.public_subnetA_id
}

variable "associate_public_ip_address" {
  description = "Should this EC2 instance have a public ip addresss"
  default     = true
}

variable "tags" {
  description = "Tags to be applied to the EC2 Instances"
  default = {
    Name = "EC2 Name"
  }
}

variable "vpc_security_group_ids" {
  description = "IDs of the security groups"
  default     = "Pull from main.tf"
}