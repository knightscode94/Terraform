provider "aws" {
  version                 = "~> 2.0"
  region                  = "eu-west-1"
  shared_credentials_file = "~/.aws/credentials"
}

module "aws_vpc" {
  source = "./VPC"
}

module "aws_webserver_sg" {
  source = "./SecurityGroups"
  name   = "WebServerSG"
  vpc_id = module.aws_vpc.vpc_id
  ingress_ports = [22,80,443]
}

module "amazon_linux2_webserver_node" {
  source                 = "./EC2"
  subnet_id              = module.aws_vpc.public_subnetA_id
  vpc_security_group_ids = module.aws_webserver_sg.aws_wsg_id
  tags = {
    Name = "WebServer_Node"
  }
  associate_public_ip_address = true
  ami = "ami-08a2aed6e0a6f9c7d"
}

data "template_file" "install_script" {
  template = file("${path.module}/EC2/scripts/setup.sh")
}

module "ubuntu_webserver_node" {
  source                 = "./EC2"
  subnet_id              = module.aws_vpc.public_subnetA_id
  vpc_security_group_ids = module.aws_webserver_sg.aws_wsg_id
  tags = {
    Name = "WebServer_Node"
  }
  associate_public_ip_address = true
  setup_script = data.template_file.install_script.template
}