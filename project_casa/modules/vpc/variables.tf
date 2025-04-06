# modules/vpc/variables.tf

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnets CIDR blocks"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnets CIDR blocks"
  type        = list(string)
}


