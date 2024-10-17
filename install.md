#Installing Terraform.

#Refer the below link
#https://developer.hashicorp.com/terraform/install

#Below steps are for installation of terraform on amazon linux,centos,redhat 

$sudo yum install -y yum-utils shadow-utils

$sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

$sudo yum -y install terraform


setup aws cli with credentails for terraform to work with aws resources

$aws configure
