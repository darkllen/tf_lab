terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
}

module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "YankinLab5v3"

  instance_type          = "t3.micro"
  key_name               = "yankin-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-01142ec3c87ec19dd"]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}