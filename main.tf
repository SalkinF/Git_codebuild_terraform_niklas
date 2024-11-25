provider "aws"{
    region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "niklas-git-codebuild-terraform"
    key = "terraform.tfstate"
    region= "eu-central-1"
  }
}




module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.16.0"

  name= "Niklas-VPC"
  cidr = "10.0.0.0/16"
  azs             = ["eu-central-1a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  public_subnet_tags = {
    Name = "Niklas-Public-Subnet"
  }
  private_subnet_tags = {
    Name = "Niklas-Private-Subnet"
  }
  tags = {
    Owner= "Niklas"
  }
}