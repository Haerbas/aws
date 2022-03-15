# aws_config.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.26"
    }
  }
}

provider "aws" {
  profile = "vizrt"
  region  = var.aws_region
}