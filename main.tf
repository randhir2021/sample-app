module "docker" {
  source = "./modules/Docker"
}

module "vpc" {
  source = "./modules/vpc"
}