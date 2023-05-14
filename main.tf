data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

module "docker" {
  source     = "./modules/ecr"
  region     = data.aws_region.current.id
  account_id = data.aws_caller_identity.current.id
}

module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source          = "./modules/eks-cluster"
  cluster_name    = "test-cluster"
  region          = data.aws_region.current.id
  account_id      = data.aws_caller_identity.current.id
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = [module.vpc.subnet1, module.vpc.subnet2, module.vpc.subnet3, module.vpc.subnet4]
  node_subnet_ids = [module.vpc.subnet1, module.vpc.subnet2]
}