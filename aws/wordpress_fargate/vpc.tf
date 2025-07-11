module "vpc" {
  source                                 = "terraform-aws-modules/vpc/aws"
  name                                   = "${var.prefix}-${var.environment}"
  cidr                                   = var.vpc_cidr
  azs                                    = data.aws_availability_zones.this.names
  private_subnets                        = var.private_subnet_cidrs
  public_subnets                         = var.public_subnet_cidrs
  enable_nat_gateway                     = true
  single_nat_gateway                     = false
  one_nat_gateway_per_az                 = false
  tags                                   = var.tags
  version                                = "~>2.0"
  enable_dns_hostnames                   = true
  create_igw                             = false
  enable_flow_log                        = true
  create_database_internet_gateway_route = false
  enable_network_address_usage_metrics   = true
}