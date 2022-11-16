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
  region = "us-west-1"
}

module "networking" {
  source = "./networking"
}

module "compute" {
  source                 = "./compute"
  vpc_security_group_ids = [] #@TODO access from networking module
}