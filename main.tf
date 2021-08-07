terraform {
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
  region  = "us-west-2"
}
variable "image_id" {
  type = string
}
resource "aws_instance" "app_server" {
  ami           = var.image_id
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}