terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }

  backend "s3" {
    key     = "global/s3/terraform.tfstate"
    encrypt = true
  }
}

