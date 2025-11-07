## PUT TERRAFORM CLOUD BLOCK HERE!  ##

terraform {
  cloud {

    organization = "taemin_tach_live"

    workspaces {
      name = "tf-cloud-test"
    }
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.01"
    }
  }



}


# Variable blocks directly within the main.tf. No arguments necessary.
variable "aws_access_key" {}
variable "aws_secret_key" {}

# provider arguments call on the variables which then call on terraform.tfvars for the values.
provider "aws" {
  region = "us-east-2"
#  access_key = var.aws_access_key
#  secret_key = var.aws_secret_key
}

# Add .gitignore file in this directory with the terraform.tfvars

resource "aws_instance" "tc_instance" {
  ami           = "ami-0c7c4e3c6b4941f0f"
  instance_type = "t3.micro"

  tags = {
    Name = "TC-triggered-instance"
  }
}