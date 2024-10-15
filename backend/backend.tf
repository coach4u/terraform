terraform {
  backend "s3" {
    bucket         = "project-terraform-statefile"    # S3 bucket name
    key            = "terraform.tfstate" # The key for the state file in the S3 bucket
    region         = "us-east-1"                      # AWS region
    dynamodb_table = "project-terraform-statefile-locks" # DynamoDB table for state locking
    encrypt        = true                             # Ensure encryption is enabled for the state file
  }
}
