variable "public_subnet_id" {
  description = "The ID of the public subnet. Value is passed as output of network module and must be set in /main.tf"
  default     = ""
}

variable "private_subnet_id" {
  description = "The ID of the private subnet. Value is passed as output of network module and must be set in /main.tf"
  default     = ""
}

variable "vpc_id" {
  description = "The id of the VPC, default value is not inlcuded, must be set in /main.tf"
  default = ""
}

variable "sg_list" {
  description = "list of security groups"
  default = []
}