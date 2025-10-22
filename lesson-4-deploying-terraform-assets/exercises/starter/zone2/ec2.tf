module "project_ec2" {
  source             = "./modules/ec2"
  instance_count     = 2
  name               = "Ubuntu-Web"
  account            = data.aws_caller_identity.current.account_id
  aws_ami            = "ami-0d902a8756c37e690"
  instance_type      = "t3.micro"
  private_subnet_ids = module.vpc.private_subnet_ids
  public_subnet_ids  = module.vpc.public_subnet_ids
  vpc_id             = module.vpc.vpc_id
  tags               = local.tags
}