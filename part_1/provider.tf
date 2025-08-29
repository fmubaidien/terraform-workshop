terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Backend configuration
  backend "s3" {
    bucket         = "faisal-workshop-terraform-state"  
    key            = "part_1/terraform.tfstate"        
    region         = "eu-west-1"                    
    # dynamodb_table = "terraform-locks"            
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-west-1"
}