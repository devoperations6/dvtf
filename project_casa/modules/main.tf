module "vpc" {
  source = "./modules/vpc"

  cidr_block      = "10.0.0.0/16"
  vpc_name        = "casa_vpc"
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
  azs             = ["us-east-1a", "us-east-1b"]
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

resource "aws_s3_bucket" "project_casa" {
  bucket = "project_casa"

  tags = {
    Name        = "project_casa"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_versioning" "project_casa" {
  bucket = aws_s3_bucket.project_casa.id

  versioning_configuration {
    status = "Enabled"
  }
}