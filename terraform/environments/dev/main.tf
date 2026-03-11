provider "aws" {
  region = "us-east-1"
}

module "dev_vpc" {
  source = "../../modules/vpc"
  vpc_cidr = "10.0.0.1/16"
  vpc_name =  "dev-vpc"
}