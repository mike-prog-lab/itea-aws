module "sg_public" {
  source = "terraform-aws-modules/security-group/aws"

  name   = "public-allow-sg"
  vpc_id = module.vpc.vpc_id

  ingress_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress_cidr_blocks  = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "sg_private" {
  source = "terraform-aws-modules/security-group/aws"

  name   = "private-allow-sg"
  vpc_id = module.vpc.vpc_id

  ingress_with_source_security_group_id = [
    {
      from_port         = 22
      to_port           = 22
      protocol          = "tcp"
      security_group_id = module.sg_public.security_group_id
    }
  ]
  egress_cidr_blocks  = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}