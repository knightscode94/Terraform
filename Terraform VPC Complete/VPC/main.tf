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

# internet gateway
resource "aws_internet_gateway" "gateway" {
  vpc_id     = aws_vpc.main.id
  depends_on = [aws_subnet.main]
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