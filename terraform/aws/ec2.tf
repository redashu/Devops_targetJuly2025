terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.11.0"
    }
  }
}

provider "aws" {
  access_key = ""
  secret_key = ""
  region = "ap-south-1"
}

# to create anything 
resource "aws_instance" "ashutoshh" {
    ami = "ami-0861f4e788f5069dd"
    instance_type = "t2.nano"
    tags = {
      Name = "ashu-vm1"
    }
  
}

