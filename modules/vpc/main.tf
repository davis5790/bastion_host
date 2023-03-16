resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "Public_Subnet_1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public_cidr_1
  tags = {
    Name = var.public_subnet_name_1
  }
}

resource "aws_subnet" "Private_Subnet_1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private_cidr_1
  tags = {
    Name = var.private_subnet_name_1
  }
}

resource "aws_subnet" "Public_Subnet_2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public_cidr_2
  tags = {
    Name = var.public_subnet_name_2
  }
}

resource "aws_subnet" "Private_Subnet_2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private_cidr_2
  tags = {
    Name = var.private_subnet_name_2
  }
}