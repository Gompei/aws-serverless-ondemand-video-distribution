terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.70.0"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Name = "example-aws-serverless-ondemand-video-distribution-resource"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"

  default_tags {
    tags = {
      Name = "example-aws-serverless-ondemand-video-distribution-resource"
    }
  }
}
