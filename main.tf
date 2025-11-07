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



provider "aws" {
  region = "us-east-2"
}

# Add .gitignore file in this directory with the terraform.tfvars

resource "aws_instance" "tc_instance" {
  ami           = "ami-0c7c4e3c6b4941f0f"
  instance_type = "t3.micro"

  tags = {
    Name = "TC-triggered-instance"
  }
}