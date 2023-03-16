module "vpc" {
  source         = "./modules/vpc"
  vpc_name       = "My VPC"
  vpc_cidr       = "10.0.0.0/16"
  public_cidr_1  = "10.0.0.0/24"
  private_cidr_1 = "10.0.1.0/24"
  public_cidr_2  = "10.0.2.0/24"
  private_cidr_2 = "10.0.3.0/24"
}

module "ec2" {
  source                 = "./modules/ec2"
  public_subnet_id_1     = module.vpc.public_subnet_id_1
  private_subnet_id_1    = module.vpc.private_subnet_id_1
  public_subnet_id_2     = module.vpc.public_subnet_id_2
  private_subnet_id_2    = module.vpc.private_subnet_id_2
  vpc_id                 = module.vpc.vpc_id
}

module "gateways" {
  source             = "./modules/gateways"
  vpc_id             = module.vpc.vpc_id
  public_subnet_id_2 = module.vpc.public_subnet_id_2
}

module "route_tables" {
  source                 = "./modules/route_tables"
  vpc_id                 = module.vpc.vpc_id
  default_route_table_id = module.vpc.default_route_table_id
  nat_id                 = module.gateways.nat_id
  igw_id                 = module.gateways.igw_id
  private_subnet_id_2    = module.vpc.private_subnet_id_2
}