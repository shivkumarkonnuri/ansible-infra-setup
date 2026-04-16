module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"
  
  name = "${var.project_name}-vpc"
  cidr = "10.0.0.0/16"

  azs = slice(data.aws_availability_zones.available.names, 0, 3)
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  
  enable_nat_gateway   = false
  enable_dns_hostnames = true
  map_public_ip_on_launch = true

  tags = local.common_tags
}

module "web_sg" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
  sg_name = "${var.project_name}-web-sg"
  ingress_ports =[22, 80, 443]
  tags = local.common_tags
}

module "ec2_instances" {
  source = "./modules/ec2-instance"
  instances = local.instances
  subnet_id = module.vpc.public_subnets[0]
  security_group_ids = [module.web_sg.sg_id]
  key_name = aws_key_pair.this.key_name
  tags = local.common_tags
}
