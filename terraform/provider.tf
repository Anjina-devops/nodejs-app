terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "exahcl-hackthon" {
  ami           = "ami-0b86aaed8ef90e45f"   # Choose AMI based on your region (this is Amazon Linux 2 for us-east-1)
  instance_type = "t3.medium"                # Free Tier Eligible

  security_groups = [ aws_security_group.allow_all.id ]
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]
  subnet_id = module.aws.subnet_id
  
  tags = {
    Name = "hcl-hackthon0322"
  }
}
resource "aws_security_group" "allow_all" {
  name        = "allow-all-traffic"
  description = "Allow all inbound and outbound traffic"
  vpc_id      = data.aws_vpc.default.id   # Using default VPC

  ingress {
    description = "Allow all inbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # All protocols
    cidr_blocks = ["0.0.0.0/0"] # Anywhere
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow-All-SG"
  }
}


