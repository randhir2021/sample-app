terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  #configuring keys like this in code is not a good practice
  access_key = "AKIAUIPVVTGANTTJUJW4"
  secret_key = "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"
}