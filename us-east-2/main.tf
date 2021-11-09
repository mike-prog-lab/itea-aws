terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.64.2"
    }
  }
}

provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      Student = "student7"
      Task = "AdditionalTask"
      Terraform = "true"
    }
  }
}

data "aws_vpc" "main" {

}