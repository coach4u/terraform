output "public_ip"{
 value=[aws_instance.intro.public_ip]
 description="Public ip address of the web server"
}
