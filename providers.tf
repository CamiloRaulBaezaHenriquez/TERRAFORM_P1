terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 5.0"
    }
  }
#   backend "s3" {
#     bucket = "tarrotomado"
#     key    = "network/terraform.tfstate"
#     region = "us-east-1"
#     assume_role = {
#       role_arn = "arn:aws:iam::975050277813:role/ROL-OIDC-GITHUB"
#     }
#   }
}

provider "aws" {
  region  = "us-east-1"
}