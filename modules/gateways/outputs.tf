output "igw_id" {
  description = "the id of the internet gateway"
  value       = aws_internet_gateway.igw.id
}

output "nat_id" {
  description = "the id of the nat gateway"
  value       = aws_nat_gateway.public_nat.id
}