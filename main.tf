module "docker" {
  source = "./modules/Docker"
}

module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source          = "./modules/eks-cluster"
  cluster_name    = "test-cluster"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = [module.vpc.subnet1, module.vpc.subnet2, module.vpc.subnet3, module.vpc.subnet4]
  kubeconfig_name = "kubeconfig"
}