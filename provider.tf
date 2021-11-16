# Adding AWS provider, It uses aws keys configured on this laptop.
provider "aws" {
  region = "us-east-1"
}

# S3 state file configuration
terraform {
  backend "s3" {
    bucket = "mybucket-tf-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}


# Create VPC
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main-vpc"
    Location = "Banglore"
    Department = "Training"
  }
}
