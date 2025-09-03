resource "aws_instance" "name" {
    ami = var.aws-myami
    instance_type = var.aws_instance_type
  
}