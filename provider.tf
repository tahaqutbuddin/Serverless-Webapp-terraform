terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.35"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

