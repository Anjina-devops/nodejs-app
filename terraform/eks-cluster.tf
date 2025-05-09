module "eks" {
  source                         = "terraform-aws-modules/eks/aws"
  version                        = "20.4.0"
  cluster_name                   = "demo-eks-cluster"
  cluster_version                = "1.29"
  cluster_endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]
      desired_size   = 2
      min_size       = 1
      max_size       = 3
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
