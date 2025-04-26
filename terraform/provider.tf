provider "aws" {

    region = "us-east-1"

  
}

resource "aws_instance" "ec2" {

    ami = "ami-0b86aaed8ef90e45f"
    instance_type = "t2.micro"



  
}