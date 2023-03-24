terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
  backend "s3" {
    bucket            = "terragrunt-528259682230-statefiles"
    // CHANGE THIS
    key               = "network-security-workshop/YOUR_NAME/terraform.tfstate"
    region            = "us-east-1"
    encrypt           = true
    dynamodb_endpoint = "terragrunt-528259682230-lockfiles"
  }
}