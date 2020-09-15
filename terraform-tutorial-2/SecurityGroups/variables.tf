variable "name" {
  description = "Name of the Security Group"
  default     = "SG"
}

variable "vpc_id" {
  description = "ID of the VPC associated with this SG"
}

variable "ingress_ports" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [22]
}

variable "open-internet" {
  description = "CIDR of the open internet"
  default     = "0.0.0.0/0"
}

variable "outbound-port" {
  description = "Port that egress traffic is allowed out through"
  default     = 0
}