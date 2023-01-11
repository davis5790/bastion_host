variable "vpc_cidr" {
  description = "The allocated CIDR block of the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC. No default value, must be specified in /main.tf"
  type        = string
  default     = "My VPC"
}

variable "public_cidr" {
  description = "The CIDR block of the public subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "public_subnet_name" {
  description = "The name of the public subnet"
  type        = string
  default     = "Public Subnet"
}

variable "private_cidr" {
  description = "The CIDR block of the private subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_name" {
  description = "The name of the private subnet"
  type        = string
  default     = "Private Subnet"
}