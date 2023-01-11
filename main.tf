module "network" {
  source       = "./modules/network"
  vpc_name     = "My VPC"
  vpc_cidr     = "10.0.0.0/16"
  public_cidr  = "10.0.0.0/24"
  private_cidr = "10.0.1.0/24"
}

module "ec2" {
    source = "./modules/ec2"
    public_subnet_id = module.network.public_subnet_id
    private_subnet_id = module.network.private_subnet_id
    vpc_id = module.network.vpc_id
}