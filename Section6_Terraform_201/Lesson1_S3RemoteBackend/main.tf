provider "aws" {
    region = "eu-west-2"
}


resource "aws_s3_bucket" "backend_bucket" {
    bucket = "tf-rb-poc-2021-02"

    versioning {
        enabled = true
    }
}