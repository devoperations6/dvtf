# module files
module "vpc" {
  source = "./modules/vpc"

  cidr_block      = "10.0.0.0/16"
  vpc_name        = "casa_vpc"
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

resource "aws_s3_bucket" "casa-bucket" {
  bucket = "casa-bucket-${random_string.suffix.result}"

  tags = {
    Name        = "casa-bucket"
  }
}
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "aws_s3_bucket_versioning" "project_casa" {
  bucket = aws_s3_bucket.casa-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
terraform {
  backend "s3" {
    bucket         = "project_casa"  # Name of your S3 bucket
    key            = "terraform.tfstate"  # Path to the state file in the bucket
    region         = "us-east-2"  # Region of your S3 bucket
    encrypt        = true  # Enable server-side encryption
  }
}