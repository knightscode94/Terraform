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
