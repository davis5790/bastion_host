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

variable "public_cidr_1" {
  description = "The CIDR block of the first public subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "public_subnet_name_1" {
  description = "The name of the first public subnet"
  type        = string
  default     = "Public Subnet_1"
}

variable "private_cidr_1" {
  description = "The CIDR block of the first private subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_name_1" {
  description = "The name of the first private subnet"
  type        = string
  default     = "Private Subnet_1"
}

variable "public_cidr_2" {
  description = "The CIDR block of the second public subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet_name_2" {
  description = "The name of the second public subnet"
  type        = string
  default     = "Public Subnet_2"
}

variable "private_cidr_2" {
  description = "The CIDR block of the second private subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet_name_2" {
  description = "The name of the second private subnet"
  type        = string
  default     = "Private Subnet_2"
}