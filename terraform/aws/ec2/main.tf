# creating ec2 instance 
resource "aws_instance" "example" {
  ami           = "ami-0861f4e788f5069dd" # Amazon Linux 2 AMI
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

# output section here 
output "my-ec2-publicIP" {
    value = aws_instance.example.public_ip
  
}

output "myaws-instanceID" {
  value = aws_instance.example.id
}