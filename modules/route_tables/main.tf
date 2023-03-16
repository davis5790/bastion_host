resource "aws_route" "public_route" {
  route_table_id         = var.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}

resource "aws_route_table" "Private_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_id
  }

  tags = {
    Name = "Private Route Table"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = var.private_subnet_id_2
  route_table_id = aws_route_table.Private_route_table.id
}