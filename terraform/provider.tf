terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "sa-east-1"
  profile = "terraform"
  default_tags {
    tags = {
      Project     = "Kubernetes"
      Environment = "Test"
      ManagedBy   = "Terraform"
    }
  }
}
