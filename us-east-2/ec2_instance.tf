module "ec2_public" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  count = length(module.vpc.public_subnets)

  name = "ec2-public-${count.index}"

  ami = var.ec2_ami
  instance_type = var.ec2_type
}

module "ec2_private" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  count = length(module.vpc.private_subnets)

  name = "ec2-private-${count.index}"

  ami = var.ec2_ami
  instance_type = var.ec2_type
}