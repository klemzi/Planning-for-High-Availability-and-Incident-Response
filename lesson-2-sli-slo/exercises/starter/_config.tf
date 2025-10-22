terraform {
   backend "s3" {
     bucket = "udacity-tf-clement" # Replace it with your S3 bucket name
     key    = "terraform/terraform.tfstate"
     region = "us-east-2"
     profile = "udacity"
   }
 }

 provider "aws" {
   region = "us-east-2"
   profile = "udacity"
 }