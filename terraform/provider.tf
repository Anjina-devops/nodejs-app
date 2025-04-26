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
  
  tags = {
    Name = "hcl-hackthon0322"
  }
}
