variable "ami-id" {
  description = "AMI ID of ubuntu 18.04LTS eu-west-1"
  default     = "ami-..."
}

variable "instance-type" {
  description = "Free tier EC2 Instance type"
  default     = "t2.micro"
}

variable "ssh-key" {
  description = "Associated Key to SSH into the EC2 Instance"
  default     = "Gamers"
}