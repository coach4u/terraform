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
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1 # or ${{ secrets.AWS_REGION }} if you set it
      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v3
        with:
          terraform_version: 1.7.5
      - name: Terraform Init
        run: terraform init
      - name: Terraform Plan
        run: terraform plan
