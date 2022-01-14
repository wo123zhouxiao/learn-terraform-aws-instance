terraform {
  backend "remote" {
    organization = "wo123zhouxiao"
    workspaces {
      name = "Example-Workspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0218d08a1f9dac831"
  instance_type = "t2.micro"
  subnet_id = "subnet-02a36bb2b5b0945b8"
  security_groups = ["sg-0d8e63069933005f6"]

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
