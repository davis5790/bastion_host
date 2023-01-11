output "vpc_id" {
  description = "The id of the VPC"
  value       = aws_vpc.my_vpc.id
}

output "public_subnet_id" {
  description = "The public subnet ID"
  value       = aws_subnet.Public_Subnet.id
}

output "private_subnet_id" {
  description = "The private subnet ID"
  value       = aws_subnet.Private_Subnet.id
}
