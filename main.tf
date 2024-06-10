provider "aws" {
  region  = "us-west-1"
}

resource "random_pet" "this" {
  length = 2
}