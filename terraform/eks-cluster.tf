module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.21.0"

  cluster_name    = "my-cluster"
  cluster_version = "1.29"
  vpc_id          = "vpc-0111d68618fb8f00b"

  subnet_ids = [
    "subnet-03c7158732a1d031e", # gitops-vpc-private-us-east-1a (10.0.3.0/24)
    "subnet-028e06d85d768a94b", # gitops-vpc-private-us-east-1b (10.0.4.0/24)
  ]

  eks_managed_node_groups = {
    default = {
      desired_size   = 2
      max_size       = 3
      min_size       = 1
      instance_types = ["t3.medium"]
    }
  }
}
