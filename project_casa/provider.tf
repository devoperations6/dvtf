terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}

# Backend configuration for Terraform state file storage in S3
terraform {
  backend "s3" {
    bucket = "project_casa"    # S3 bucket name for storing the state file
    key    = "terraform.tfstate"             # Path within the S3 bucket (can be a folder, too)
    region = "us-east-2"                     # AWS region where the bucket is located
    encrypt = true                           # Enable encryption for the state file (recommended)
    
  }
}