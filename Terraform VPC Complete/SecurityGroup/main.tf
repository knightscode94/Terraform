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
