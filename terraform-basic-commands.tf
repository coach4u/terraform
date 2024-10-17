#Terraform commands to get started:


terraform init     (initializes the working directory by downloading provider plugins and configuring the backend. It prepares Terraform for future commands like plan and apply.)

terraform validate (checks the syntax and structure of your Terraform configuration files.Ensures they are correct and ready for deployment.used after you initialize your working directory with terraform init.) 

terraform plan     (preview changes as to what it is going to create / update / destroy.without making any actual changes)

terraform apply    (Executes the changes defined in your Terraform configuration, creating, modifying, or destroying resources as shown in the terraform plan)

terraform destroy   (Removes all the resources defined in your Terraform configuration, deleting the infrastructure that was previously created.)

