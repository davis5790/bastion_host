output "vpc_id" {
  description = "The id of the VPC"
  value       = aws_vpc.my_vpc.id
}

output "default_route_table_id" {
  description = "The id of the vpc's default route table"
  value       = aws_vpc.my_vpc.default_route_table_id
}

output "public_subnet_id_1" {
  description = "The public subnet ID"
  value       = aws_subnet.Public_Subnet_1.id
}

output "private_subnet_id_1" {
  description = "The private subnet ID"
  value       = aws_subnet.Private_Subnet_1.id
}

output "public_subnet_id_2" {
  description = "The public subnet ID"
  value       = aws_subnet.Public_Subnet_2.id
}

output "private_subnet_id_2" {
  description = "The private subnet ID"
  value       = aws_subnet.Private_Subnet_2.id
}