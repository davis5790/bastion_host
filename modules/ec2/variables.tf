variable "public_subnet_id_1" {
  description = "The ID of the first public subnet. Value is passed as output of network module and must be set in /main.tf"
  default     = ""
}

variable "private_subnet_id_1" {
  description = "The ID of the first private subnet. Value is passed as output of network module and must be set in /main.tf"
  default     = ""
}

variable "public_subnet_id_2" {
  description = "The ID of the second public subnet. Value is passed as output of network module and must be set in /main.tf"
  default     = ""
}

variable "private_subnet_id_2" {
  description = "The ID of the second private subnet. Value is passed as output of network module and must be set in /main.tf"
  default     = ""
}

variable "vpc_id" {
  description = "The id of the VPC, default value is not inlcuded, must be set in /main.tf"
  default     = ""
}

variable "sg_list" {
  description = "list of security groups"
  default     = []
}