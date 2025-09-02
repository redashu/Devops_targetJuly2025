# using existing reousrces 


# creating ec2 instance 
resource "aws_instance" "example" {
  ami           = "ami-0861f4e788f5069dd" # Amazon Linux 2 AMI
  instance_type = "t3.micro"
  #security_groups = [data.aws_security_group.selected.name]
  vpc_security_group_ids = [data.aws_security_group.selected.id, aws_security_group.allow_tls.id]
  key_name = data.aws_key_pair.selected.key_name
  #depends_on = [ data.aws_security_group.selected, data.aws_key_pair.selected]

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

output "aws_curretec2status" {
  value = aws_instance.example.instance_state
  
}


data "aws_security_group" "selected" {
  id = "sg-0ce6848fd01a6f204"
}

data "aws_key_pair" "selected" {
  key_name = "ashu-delvex"
}

data "aws_vpc" "main" {
  id = "vpc-0b50404076d0a2ed9"
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.main.id

  tags = {
    Name = "ashutoshh secyurity group"
  }
}
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = data.aws_vpc.main.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}