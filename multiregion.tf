provider "aws" {
  alias = "region-east1"
  region = "us-east-1"
}

provider "aws" {
  alias = "region-east2"
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"
  provider = aws.region-east1
  key_name="key121"
}

resource "aws_instance" "example2" {
  ami = "ami-050cd642fd83388e4"
  instance_type = "t2.micro"
  provider = aws.region-east2
}
