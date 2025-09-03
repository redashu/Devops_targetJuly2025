output "aws-ec2-public-ip" {
    value = aws_instance.name.public_ip
  
}

output "aws_instance_id" {
    value = aws_instance.name.id
  
}