module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.1.0/24"

  azs             = ["us-east-2a"]
  private_subnets = ["10.0.1.0/25"]
  public_subnets  = ["10.0.1.128/25"]

  create_igw = true
}