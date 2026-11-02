module "alb" {
  source = "./modules/alb"

  project_name      = var.project_name
  vpc_id            = var.vpc_id
  public_subnet_ids = var.public_subnet_ids
}

module "asg" {
  source = "./modules/asg"

  project_name          = var.project_name
  vpc_id                = var.vpc_id
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  private_subnet_ids    = var.private_subnet_ids
  target_group_arn      = module.alb.target_group_arn
  alb_security_group_id = module.alb.alb_security_group_id
}
