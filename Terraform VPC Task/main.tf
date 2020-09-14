provider "aws" {
  region = "eu-west-1"
}

# VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Subnet
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  depends_on = [aws_vpc.main]
}

# Security Group
resource "aws_security_group" "Default_SecGrp" {
  name        = "allow_ssh"
  description = "Allows inbound SSH traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow incoming SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  depends_on = [aws_subnet.main]

}

# internet gateway
resource "aws_internet_gateway" "gateway" {
  vpc_id     = aws_vpc.main.id
  depends_on = [aws_subnet.main]
}

# EC2 Instance
resource "aws_instance" "EC2" {
  ami           = var.ami-id
  instance_type = var.instance-type
  key_name      = var.ssh-key

  depends_on                  = [aws_internet_gateway.gateway]
  vpc_security_group_ids      = [aws_security_group.Default_SecGrp.id]
  subnet_id                   = aws_subnet.main.id
  associate_public_ip_address = true
}

# Route Table
resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
  depends_on = [aws_subnet.main]
}

# route table association
resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.routetable.id
}