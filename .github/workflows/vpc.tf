resource "aws_vpc" "casa" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "casa"
  }
}