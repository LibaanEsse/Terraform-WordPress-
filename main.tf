module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block    = var.vpc_cidr_block
  vpc_tags          = var.vpc_tags
  subnet_cidr_block = var.subnet_cidr_block
  subnet_tags       = var.subnet_tags
  igw_tags          = var.igw_tags
  route_table_tags  = var.route_table_tags
}


module "ec2" {
  source       = "./modules/ec2"
  ami_id       = var.ami_id
  instance_type = var.instance_type
  subnet_id    = module.vpc.subnet_id
  vpc_id       = module.vpc.vpc_id
  key_name     = var.key_name
  public_key   = var.public_key
  associate_public_ip_address = var.associate_public_ip_address
  ec2_tags     = var.ec2_tags
  user_data_path = var.user_data_path

  ingress_rules = [
    {
      description = "Allow SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "Allow HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]  

  egress_rules = [
    {
      description = "Allow all outbound"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]  # <- closes egress_rules list
}  


