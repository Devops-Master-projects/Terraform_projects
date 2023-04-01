module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.10.0"

  cluster_name = "myapp-eks-cluster"  
  cluster_version = "1.25"

  subnet_ids = module.myapp-vpc.private_subnets
  vpc_id = module.myapp-vpc.vpc_id
    
  cluster_endpoint_public_access = true
    
  tags = {
    environment = "development"
    application = "myapp"
  }

  eks_managed_node_groups = {         #{   #worker nodes --> is it self managed,semi managed or Fargate {ec2, Nodegroup , Fargate}
    dev = {                         #  # dev = the node group so eks will create 1 node group with 3 insstance inside
      min_size     = 1
      max_size     = 3
      desired_size = 3

      instance_types = ["t2.small"]
    }
  }
}
