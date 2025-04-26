resource "aws_security_group" "eks_allow_all" {
  name        = "eks-allow-all"
  description = "Allow all traffic for EKS nodes"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow all inbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-allow-all"
  }
}
