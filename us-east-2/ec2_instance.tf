module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  count = length(module.vpc.public_subnets)

  name = "ec2-public-${count.index}"

  ami                    = var.ec2_ami
  instance_type          = var.ec2_type
  key_name               = aws_key_pair.student7.key_name
  vpc_security_group_ids = [module.sg_public.security_group_id]
  subnet_id              = module.vpc.public_subnets[count.index]
}

module "ec2_private" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  count = length(module.vpc.private_subnets)

  name = "ec2-private-${count.index}"

  ami                    = var.ec2_ami
  instance_type          = var.ec2_type
  key_name               = aws_key_pair.student7.key_name
  vpc_security_group_ids = [module.sg_private.security_group_id]
  subnet_id              = module.vpc.private_subnets[count.index]

  iam_instance_profile = module.iam_s3_role.iam_instance_profile_name
}