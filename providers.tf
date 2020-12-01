provider "aws" {
    region = var.region
}

terraform {
  backend "s3"{
      bucket = "javahome-tf-test"
      key    = "terraform.tfstate"
      region = "eu-west-1"
  }
}