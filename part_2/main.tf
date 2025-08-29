module "vpc" {
  source = "./vpc"

    vpc_cidr = "10.0.0.0/16"
    vpc_name = "ghost-vpc"
    private_subnet_cidr = "10.0.1.0/28"
    public_subnet_cidr = "10.0.2.0/28"
    aws_region = "eu-west-1"
}


module "rds" {
    source = "./rds"

    rds_subnet_ids = [module.vpc.private_subnet_id]
    rds_sg_ids = [module.vpc.rds_sg_id]
    db_identifier = 
    db_password = ""
    db_username = 
    db_name = 
}

module "ec2" {
  source = "./ec2"

  instance_type =
  ec2_sg_ids = [module.vpc.ec2_sg_id]
  ec2_subnet_id = module.vpc.public_subnet_id
  key_name = "my-key"
  db_ip = 
  db_password = ""
  db_username = 
  db_name = 
}