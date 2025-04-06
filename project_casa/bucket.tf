resource "aws_s3_bucket" "bucket_tfst" {
  bucket = "bucket_tfst"

  tags = {
    Name        = "bucket_tfst"
  }
  lifecycle {
    prevent_destroy = true
  }
}
resource "aws_s3_bucket_public_access_block" "bucket_tfst" {
  bucket = aws_s3_bucket.bucket_tfst.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}
resource "aws_s3_bucket_versioning" "bucket_tfst" {
  bucket = aws_s3_bucket.bucket_tfst.id

  versioning_configuration {
    status = "Enabled"
  }
}
terraform {
  backend "s3" {
    bucket         = aws_s3_bucket.bucket_tfst.id
    key            = "terraform.tfstate"
    region         = "us-east-2"
  }
}