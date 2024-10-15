provider "aws" {
  region = "us-east-1"
}

# Create an S3 bucket to store Terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "project-terraform-statefile"

  # Prevent accidental bucket deletion
  lifecycle {
    prevent_destroy = true
  }

  # Enable versioning to keep track of state file changes
  versioning {
    enabled = true
  }
}

# Enable server-side encryption for the S3 bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Create a DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "project-terraform-statefile-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "TerraformStateLock"
  }
}

# Define public access block for the S3 bucket
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}

