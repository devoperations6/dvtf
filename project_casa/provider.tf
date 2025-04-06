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

# terraform {
#   backend "s3" {
#     bucket         = "project_casa"  # Replace with your S3 bucket name
#     key            = "terraform.tfstate"  # Path to the state file in the bucket
#     region         = "us-east-2"  # Replace with your bucket's region
#     encrypt        = true  # Enable server-side encryption
#   }
# }
