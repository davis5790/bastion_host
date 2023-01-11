resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "Public_Subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public_cidr
  tags = {
    Name = var.public_subnet_name
  }
}

resource "aws_subnet" "Private_Subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private_cidr
  tags = {
    Name = var.private_subnet_name
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "main"
  }
}

resource "aws_eip" "natgateway_eip" {
  vpc      = true
}

resource "aws_nat_gateway" "public_nat" {
  allocation_id = aws_eip.natgateway_eip.id
  subnet_id     = aws_subnet.Public_Subnet.id

  tags = {
    Name = "NAT Gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_route" "public_route" {
  route_table_id = aws_vpc.my_vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

resource "aws_route_table" "Private_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.public_nat.id
  }

  tags = {
    Name = "Private Route Table"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.Private_Subnet.id
  route_table_id = aws_route_table.Private_route_table.id
}