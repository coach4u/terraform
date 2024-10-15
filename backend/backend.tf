terraform {
  backend "s3" {
    bucket         = "project-terraform-statefile"    
    key            = "terraform.tfstate" 
    region         = "us-east-1"                      
    dynamodb_table = "project-terraform-statefile-locks" 
    encrypt        = true                             
  }
}
