resource "aws_instance" "instance_remote" {
    ami="ami-06b21ccaeff8cd686"
    key_name="keyfilehere"
    instance_type="t2.micro"

}
