variable "vpc_id" {
  description = "The vpc ID, no default, set in /main.tf"
  default     = ""
}
variable "default_route_table_id" {
  description = "The id of the vpc's default route table, no default, must be set in /main.tf"
  default     = ""
}

variable "igw_id" {
  description = "The id of the internet gateway, no default, must be set in /main.tf"
  default     = ""
}

variable "nat_id" {
  description = "The id of the nat gateway, no default, set in /main.tf"
  default     = ""
}

variable "private_subnet_id_2" {
  description = "The Id of the second subnet, set in /main.tf"
  default     = ""
}