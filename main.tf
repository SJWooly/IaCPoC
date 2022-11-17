terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-1"
}

module "networking" {
  source = "./networking"
}

module "compute" {
  source                 = "./compute"
  subnet_id              = module.networking.subnet_id
  vpc_security_group_ids = module.networking.vpc_security_group_ids
}