name: Terraform AWS

on:
  push:
    paths:
      - 'aws/**'
      - '.github/workflows/terraform.yml'

jobs:
  terraform:
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: ./aws
    steps:
    - uses: actions/checkout@v4
    - name: Set up Terraform
      uses: hashicorp/setup-terraform@v3
      with:
        terraform_version: 1.7.5
    - name: Terraform Init
      run: terraform init
    - name: Terraform Plan
      run: terraform plan
    # Add apply step with appropriate approval if desired
