provider "aws" {
  region = "us-east-1"
}


resource "aws_security_group" "sg1" {
 name = "terraform-sg-jenkins"
 ingress {
         from_port = 8080
         to_port = 8080
         protocol = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
         from_port = 22
         to_port = 22
         protocol = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
 }

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}

}



resource "aws_instance" "intro" {
  ami                    = "ami-08a0d1e16fc3f61ea"
  instance_type          = "t2.micro"
  key_name               = "yourkey"
  vpc_security_group_ids = [aws_security_group.sg1.id]
  user_data = file("jenkins.sh")
  tags = {
    Name    = "Jenkins-Instance"
    Project = "Dev"
  }
}
