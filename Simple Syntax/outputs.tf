output "ec2_id" {
  value = aws_instance.EC2.id
}
# This will output the ID of the instance that is created when the terraform plan command is run