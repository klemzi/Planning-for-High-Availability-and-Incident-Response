terraform {
  backend "s3" {
    bucket  = "udacity-tf-clement-west"
    key     = "terraform/terraform.tfstate"
    region  = "us-west-1"
    profile = "udacity"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.17.0"
    }
  }
}

provider "aws" {
  region  = "us-west-1"
  profile = "udacity"
}