provider "aws" {
    region = var.region
}

terraform {
  backend "s3"{
      bucket = "javahome-tf-sree"
      key    = "terraform.tfstate"
      region = "eu-west-1"
  }
}