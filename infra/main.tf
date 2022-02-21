terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.13.5"
}

provider "aws" {
  profile = "chrismlittle"
  region  = "eu-west-2"
}


module "rightmove_scrape" {
  aws_account_id = var.aws_account_id
  aws_region     = var.aws_region
  project        = var.project
  source         = "./rightmove-scrape"
}
