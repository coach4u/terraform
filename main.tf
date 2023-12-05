provider "aws" {
   region="us-east-1"
}

resource "aws_security_group" "instance" {
 name = "terraform-example-instance"
 ingress {
         from_port = 80
         to_port = 80
         protocol = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
 }
}


resource "aws_instance" "example" {
 ami="ami-05c13eab67c5d8861"
 instance_type="t2.micro"
 key_name="key052"
 vpc_security_group_ids = [aws_security_group.instance.id]
 tags={
   Name="Terraform-example"
}
}
