terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
// Incremental test and build
provider "aws" {
  region = var.region_name
}