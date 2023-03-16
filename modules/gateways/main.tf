resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "main"
  }
}

resource "aws_eip" "natgateway_eip" {
  vpc = true
}

resource "aws_nat_gateway" "public_nat" {
  allocation_id = aws_eip.natgateway_eip.id
  subnet_id     = var.public_subnet_id_2
  tags = {
    Name = "NAT Gateway"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}