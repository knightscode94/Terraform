output "ec2_id" {
  value = aws_instance.EC2.public_ip
}