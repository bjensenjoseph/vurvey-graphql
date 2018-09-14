# Configure the AWS Provider
provider "aws" {
  region      = "${var.aws_region}"
  access_key  = "${var.aws_access_key}"
  secret_key  = "${var.aws_secret_key}"
}

//terraform {
//  backend "s3" {
//    bucket = "vurv-terraform"
//    key    = "vurv.tfstate"
//    region = "us-west-2"
//  }
//}
