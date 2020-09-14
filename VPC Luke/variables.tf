variable "region" {
  default = "eu-west-1"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "open_internet" {
  default = "0.0.0.0/0"
}

variable "instance" {
  description = "This variable state the instance type for your EC2"
  default     = "t2.micro"
}

variable "ami_id" {
  default = "ami-04137ed1a354f54c4"
}

variable "key_name" {
  default = "LukePC"
}

variable "enable_public_ip" {
  description = "Enable if EC2 instace should have public ip address"
  default     = true
}

variable "inbound_port" {
  description = "List of ingress ports"
  default     = 22
}

variable "outbound_port" {
  description = "Port open to allow outbound connection"
  default     = 0
}